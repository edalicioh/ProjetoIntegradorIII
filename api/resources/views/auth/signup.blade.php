@extends('auth.layout')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <img class="img-logo-login" src="{{ asset('img/Logo_IFC_horizontal.png') }}" alt="">
        <div class="col-md-6">
            @if( session()->get('error') )
                <div class="alert alert-danger" role="alert">
                    {{  session()->get('error') }}
                    {{  session()->forget('error') }}
                </div>
            @endif
            <div class="card {{ !session()->get('show') ?  'show' : 'hide' }} ">
                <div class="card-body text-center card-login-sign">
                    <h2>Faça seu login</h2>

                    <form action="/sign" method="post" class="mt-4">
                        @csrf
                        <div class="form-group">
                            <input type="email" class="form-control" name="email"  placeholder="Email">
                        </div>
                        <button type="submit" class="btn btn-primary btn-lg btn-block mb-3">Entra</button>
                        <a href="/login">Voltar para login </a>
                    </form>
                </div>
            </div>

            <!------------------>


            <div class="card {{ session()->get('show') ?  'show' : 'hide' }}">
                <div class="card-body text-center card-login-sign">
                <h2>Faça seu login </h2>
                    <form action="/sign" method="post" class="mt-4">
                        @csrf
                        <input name="_method" type="hidden" value="PUT">
                        <input name="id" type="hidden" value="{{ session()->get('id') }}">
                        <div class="form-group">
                            <input type="password" class="form-control" name="password" placeholder="Senha">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="passwordConf" placeholder="Senha">
                        </div>
                        <button type="submit" class="btn btn-primary btn-lg btn-block mb-3">Entra</button>
                        <a href="/sign" {{ session()->get('show') ? session()->forget('show')  : '' }} >Voltar</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

