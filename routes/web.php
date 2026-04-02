<?php

use Illuminate\Support\Facades\Route;

Route::get('/clear', function () {
    \Illuminate\Support\Facades\Artisan::call('optimize:clear');
});

Route::get('cron', 'CronController@cron')->name('cron');

// User Support Ticket
Route::controller('TicketController')->prefix('ticket')->name('ticket.')->group(function () {
    Route::get('/', 'supportTicket')->name('index');
    Route::get('new', 'openSupportTicket')->name('open');
    Route::post('create', 'storeSupportTicket')->name('store');
    Route::get('view/{ticket}', 'viewTicket')->name('view');
    Route::post('reply/{id}', 'replyTicket')->name('reply');
    Route::post('close/{id}', 'closeTicket')->name('close');
    Route::get('download/{attachment_id}', 'ticketDownload')->name('download');
});


Route::controller('SiteController')->group(function () {
    Route::post('/subscribe', 'addSubscriber')->name('subscribe');
    Route::get('/contact', 'contact')->name('contact');
    Route::post('/contact', 'contactSubmit')->name('contact.submit');
    Route::post('/inquiry-submit', 'inquirySubmit')->name('inquiry.submit');
    Route::get('blog', 'blog')->name('blog');
    Route::get('blog/{slug}', 'blogDetails')->name('blog.details');
    Route::get('/change/{lang?}', 'changeLanguage')->name('lang');
    Route::get('cookie-policy', 'cookiePolicy')->name('cookie.policy');
    Route::get('/cookie/accept', 'cookieAccept')->name('cookie.accept');
    Route::get('policy/{slug}', 'policyPages')->name('policy.pages');
    Route::get('placeholder-image/{size}', 'placeholderImage')->withoutMiddleware('maintenance')->name('placeholder.image');
    Route::get('maintenance-mode', 'maintenance')->withoutMiddleware('maintenance')->name('maintenance');
    Route::get('/accommodation', 'accommodation')->name('accommodation');
    Route::get('/special-offers', 'specialOffers')->name('special_offers');
    Route::get('/metting-events', 'meetingEvents')->name('meeting_events');
    Route::get('/travel-guide', 'travelGuide')->name('travel_guide');
    Route::get('/about', 'about')->name('about');
    Route::get('/booking', 'booking')->name('booking');
    Route::get('/search', 'search')->name('search');

    Route::get('/', 'index')->name('home');
    Route::get('/{slug}', 'checkKey')->name('check.key');
});
