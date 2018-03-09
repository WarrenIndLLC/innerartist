<?php namespace App\Http\Controllers;

use App\Label;
use Input, Auth, Exception;
use App\Http\Controllers\Controller;

class LabelsController extends Controller {

    public function __construct()
    {
        $this->middleware('loggedIn');
    }

    /**
     * Get photos user has added given label to.
     *
     * @param  string $label
     * @return Collection
     */
    public function getPhotosLabeled($label) {
        return Auth::user()->photos()->whereHas('labels', function($q) use($label) {
            $q->where('name', $label);
        })->get();
    }

    /**
     * Attach label to a photo.
     *
     * @return Response
     */
    public function attach()
    {
        $name = Input::get('label');

        $label = Label::where('name', $name)->firstOrFail();

        try {
            $label->photos()->attach(Input::get('photoId'));
        } catch (Exception $e) {
            return response()->json(trans('app.'.$name.'Exists'), 422);
        }


        return response()->json(trans('app.'.$name.'Success'));
    }

    /**
     * Detach label from photo.
     *
     * @return Response
     */
    public function detach()
    {
        $label = Label::where('name', Input::get('label'))->firstOrFail();

        $label->photos()->detach(Input::get('photoId'));

        return response()->json(trans('app.'.Input::get('label').'DetachSuccess'));
    }
}