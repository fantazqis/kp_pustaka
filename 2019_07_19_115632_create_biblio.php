<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBiblio extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
          Schema::create('biblio', function (Blueprint $table) {
            $table->increments('biblio_id');
            $table->integer('gmd_id');
            $table->text('title');
            $table->string('sor',200);
			$table->string('edition',50);
			$table->string('isbn_issn',20);
            $table->integer('publisher_id');
            $table->string('publish_year',20);
            $table->string('collation',50);
			$table->string('series_title',200);
            $table->string('call_number',50);
            $table->char('language_id');
            $table->string('source',3);
            $table->integer('publish_place_id');
			$table->string('classification',40);
            $table->text('notes');
            $table->string('image',100);
			$table->string('file_att',225);
            $table->smallInteger('opac_hide');
			$table->smallInteger('promoted');
            $table->text('labels');
            $table->integer('frequency_id');
			$table->text('spec_detail_info');
			$table->integer('content_type_id');
            $table->integer('media_type_id');
            $table->integer('carrier_type_id');
			$table->dateTime('input_date');
			$table->dateTime('last_update');
			$table->integer('uid');
			$table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('biblio');
    }
}
