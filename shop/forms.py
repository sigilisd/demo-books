from django import forms
from .models import Products

class ProductForm(forms.ModelForm):
    class Meta:
        model = Products
        fields = '__all__'  # Включает все поля товара в форму

        labels = {
            'article': 'Артикул',
            'name': 'Название книги',
            'unit': 'Единица измерения',
            'price': 'Цена (руб.)',
            'provider': 'Поставщик',
            'manufacturer': 'Производитель',
            'category': 'Категория',
            'discount': 'Скидка (%)',
            'amount': 'Количество на складе',
            'description': 'Описание книги',
            'photo': 'Имя файла фотографии',
        }