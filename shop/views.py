from django.shortcuts import render, redirect, get_object_or_404
from .models import Users, Products, Orders, Categories, Manufacturers
from .forms import ProductForm

# 1. ОКНО ВХОДА (Первый экран)
def login_view(request):
    error = None
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        
        # Ищем пользователя в БД по email и паролю
        user = Users.objects.filter(email=email, password=password).first()
        
        if user:
            # Сохраняем данные пользователя в сессию
            request.session['user_id'] = user.id
            request.session['role_id'] = user.role.id  # 1-Админ, 2-Менеджер, 3-Клиент
            request.session['user_name'] = f"{user.first_name} {user.last_name}"
            return redirect('product_list')
        else:
            error = "Неверный логин или пароль!"
            
    return render(request, 'shop/login.html', {'error': error})

# 2. ВХОД КАК ГОСТЬ
def guest_login(request):
    request.session['user_id'] = None
    request.session['role_id'] = 0  # 0 - роль Гостя
    request.session['user_name'] = "Гость"
    return redirect('product_list')

# 3. ВЫХОД ИЗ СИСТЕМЫ
def logout_view(request):
    request.session.flush() # Очищаем сессию
    return redirect('login')

# 4. ПРОСМОТР ТОВАРОВ (с разграничением прав)
def product_list_view(request):
    # Проверка: если пользователь вообще не заходил, отправляем на логин
    if 'role_id' not in request.session:
        return redirect('login')
        
    role_id = request.session['role_id']
    products = Products.objects.all()
    
    # Списки для выпадающих фильтров (нужны только Менеджеру и Админу)
    categories = Categories.objects.all()
    manufacturers = Manufacturers.objects.all()

    # Фильтрация, сортировка и поиск доступны ТОЛЬКО Менеджеру (2) и Админу (1)
    if role_id in [1, 2]:
        # Поиск
        search_query = request.GET.get('search', '')
        if search_query:
            products = products.filter(name__icontains=search_query)
            
        # Фильтр по категории
        cat_id = request.GET.get('category', '')
        if cat_id:
            products = products.filter(category_id=cat_id)
            
        # Фильтр по производителю
        man_id = request.GET.get('manufacturer', '')
        if man_id:
            products = products.filter(manufacturer_id=man_id)
            
        # Сортировка по цене
        sort = request.GET.get('sort', '')
        if sort == 'asc':
            products = products.order_by('price')
        elif sort == 'desc':
            products = products.order_by('-price')

    context = {
        'products': products,
        'categories': categories,
        'manufacturers': manufacturers,
        'role_id': role_id
    }
    return render(request, 'shop/product_list.html', context)

# 5. ПРОСМОТР ЗАКАЗОВ (Только для Менеджера/Админа)
def order_list_view(request):
    if request.session.get('role_id') not in [1, 2]:
        return redirect('product_list') # Если не менеджер/админ — возвращаем к товарам
        
    orders = Orders.objects.all()
    return render(request, 'shop/order_list.html', {'orders': orders})

# 6. ДОБАВЛЕНИЕ ТОВАРА (Только для Админа)
def product_create(request):
    if request.session.get('role_id') != 1:
        return redirect('product_list')
        
    form = ProductForm(request.POST or None)
    if request.method == 'POST' and form.is_valid():
        form.save()
        return redirect('product_list')
        
    return render(request, 'shop/product_form.html', {'form': form, 'title': 'Добавление товара'})

# 7. РЕДАКТИРОВАНИЕ ТОВАРА (Только для Админа)
def product_update(request, pk):
    if request.session.get('role_id') != 1:
        return redirect('product_list')
        
    product = get_object_or_404(Products, pk=pk)
    form = ProductForm(request.POST or None, instance=product)
    if request.method == 'POST' and form.is_valid():
        form.save()
        return redirect('product_list')
        
    return render(request, 'shop/product_form.html', {'form': form, 'title': 'Редактирование товара'})

# 8. УДАЛЕНИЕ ТОВАРА (Только для Админа)
def product_delete(request, pk):
    if request.session.get('role_id') != 1:
        return redirect('product_list')
        
    product = get_object_or_404(Products, pk=pk)
    if request.method == 'POST':
        product.delete()
        return redirect('product_list')
        
    return render(request, 'shop/delete_form.html', {'product': product})