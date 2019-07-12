<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBooksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('books', function (Blueprint $table) {
            $table->increments('id');
            $table->string('kode_buku')->nullable();
            $table->string('title');
            $table->integer('tahun_terbit')->nullable();
            $table->string('penerbit')->nullable();
            $table->text('deskripsi')->nullable();
            $table->integer('author_id')->unsigned();
            $table->integer('amount')->unsigned();
            $table->integer('stock')->nullable();
            $table->string('no_rak')->nullable();
            $table->string('cover')->nullable();
            $table->integer('category_id')->unsigned();
            $table->timestamps();

            $table->foreign('author_id')->references('id')->on('authors')
                ->onUpdate('cascade')->onDelete('cascade');
            
            $table->foreign('category_id')->references('id')->on('categories')
                ->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('books');
    }
}
