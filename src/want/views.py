from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def want(request):
    if 'to_get' in request.GET:
        to_get = request.GET['to_get']
        if to_get == '5000-trillion-yen':
            result = '5000兆円欲しい！'
        else:
            result = '貴様には何もやらぬ！'
        return HttpResponse(result)
