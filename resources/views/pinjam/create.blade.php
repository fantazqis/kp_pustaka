@extends('layouts.app')

@section('content')
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <ul class="breadcrumb">
          <li><a href="{{ url('/home') }}">Dashboard</a></li>
          <li><a href="{{ url('/data/statistics') }}">Peminjaman</a></li>
          <li class="active">Tambah Peminjaman</li>
        </ul>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h2 class="panel-title">Form Peminjaman</h2>
          </div>

          <div class="panel-body">
            {!! Form::open(['url' => route('borrow.store'),
            'method' => 'post', 'class'=>'form-horizontal']) !!}
            @include('pinjam._form')
            {!! Form::close() !!}
          </div>
        </div>
      </div>
    </div>
  </div>
@endsection

