<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBiblioLog extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
			$table->integer('biblio_log_id');
            $table->integer('biblio_id');
            $table->integer('user_id');
            $table->string('realname',100);
			$table->text('title');
			$table->string('ip',200);
            $table->string('action',50);
            $table->string('affectedrow',50);
			$table->text('rawdata');
			$table->text('additional_information');
            $table->dateTime('date');
			$table->timestamps();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
       Schema::dropIfExists('biblio_log');
    }
}
