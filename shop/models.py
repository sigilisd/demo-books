# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Categories(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'categories'

    def __str__(self):
        return self.name if self.name else "Без названия"


class Manufacturers(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'manufacturers'

    def __str__(self):
        return self.name if self.name else "Без названия"


class Orders(models.Model):
    order_date = models.DateField(blank=True, null=True)
    order_delivery = models.DateField(blank=True, null=True)
    pickup_point = models.ForeignKey('PickupPoints', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey('Users', models.DO_NOTHING, blank=True, null=True)
    code = models.IntegerField(blank=True, null=True)
    order_status = models.ForeignKey('OrdersStatus', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'orders'

    def __str__(self):
        return self.name if self.name else "Без названия"


class OrdersArticle(models.Model):
    order = models.ForeignKey(Orders, models.DO_NOTHING, blank=True, null=True)
    product = models.ForeignKey('Products', models.DO_NOTHING, blank=True, null=True)
    amount = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'orders_article'

    def __str__(self):
        return self.name if self.name else "Без названия"


class OrdersStatus(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'orders_status'

    def __str__(self):
        return self.name if self.name else "Без названия"


class PickupPoints(models.Model):
    index = models.IntegerField(blank=True, null=True)
    city = models.CharField(max_length=255, blank=True, null=True)
    street = models.CharField(max_length=255, blank=True, null=True)
    building = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pickup_points'

    def __str__(self):
        return self.name if self.name else "Без названия"


class Products(models.Model):
    article = models.CharField(max_length=255, blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    unit = models.ForeignKey('Units', models.DO_NOTHING, blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)
    provider = models.ForeignKey('Providers', models.DO_NOTHING, blank=True, null=True)
    manufacturer = models.ForeignKey(Manufacturers, models.DO_NOTHING, blank=True, null=True)
    category = models.ForeignKey(Categories, models.DO_NOTHING, blank=True, null=True)
    discount = models.IntegerField(blank=True, null=True)
    amount = models.IntegerField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    photo = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'products'

    @property
    def final_price(self):
        if self.discount and self.discount > 0:
                # Переводим в float для безопасного расчета и вычисляем цену со скидкой
            discounted_price = float(self.price) * (1 - self.discount / 100)
            return round(discounted_price, 2)  # Округляем до 2 знаков
        return self.price


class Providers(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'providers'

    def __str__(self):
        return self.name if self.name else "Без названия"


class Roles(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'roles'


class Units(models.Model):
    name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'units'

    def __str__(self):
        return self.name if self.name else "Без названия"


class Users(models.Model):
    role = models.ForeignKey(Roles, models.DO_NOTHING, blank=True, null=True)
    first_name = models.CharField(max_length=255, blank=True, null=True)
    last_name = models.CharField(max_length=255, blank=True, null=True)
    patronymic = models.CharField(max_length=255, blank=True, null=True)
    email = models.CharField(max_length=255, blank=True, null=True)
    password = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'users'
