<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\Page;
use Illuminate\Support\Facades\View;

class ActiveTemplateMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $viewShare['activeUser'] = auth()->check() ? authUser() : authUser('user');
        view()->share($viewShare);

        view()->composer(['Template::partials.frontend.header', 'Template::partials.frontend.footer'], function ($view) {
            $view->with([
                'pages'       => \App\Models\Page::notDefault()->where('tempname', activeTemplate())->orderByDesc('id')->get(),
                'header'      => getContent('header.content', true),
                'menu_left'   => get_menu('menu_header_left'),
                'menu_right'  => get_menu('menu_header_right'),
            ]);
        });
        View::addNamespace('Template', resource_path('views/templates/' . activeTemplateName()));

        return $next($request);
    }
}
