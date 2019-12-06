@extends('auth.layout')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <img class="img-logo-login" src="{{ asset('img/Logo_IFC_horizontal.png') }}" alt="">
        <div class="col-md-6">
            <div class="card">
                <Login></Login>
            </div>
        </div>
    </div>
</div>
@endsection

