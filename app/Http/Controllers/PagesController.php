<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PagesController extends Controller
{
	// create root() function
	public function root() {
		return view('pages.root');
	}
}
