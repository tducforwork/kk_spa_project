<?php

namespace App\Http\Controllers;

use App\Constants\Status;
use App\Models\AdminNotification;
use App\Models\Frontend;
use App\Models\Language;
use App\Models\Page;
use App\Models\Room;
use App\Models\Subscriber;
use App\Models\SupportMessage;
use App\Models\SupportTicket;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Services\ContentService;
use App\Models\Key;
use App\Models\Post;
use App\Models\CategoryPost;
use App\Models\CategoryRoom;
use App\Models\CategoryRestaurant;
use App\Models\Restaurant;
use App\Models\MiceEvent;
use App\Models\Facility;
use App\Models\SpecialOffer;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Validator;

class SiteController extends Controller
{
    protected $contentService;

    public function __construct(ContentService $contentService)
    {
        $this->contentService = $contentService;
    }

    public function index()
    {
        if (isset($_GET['reference'])) {
            $reference = $_GET['reference'];
            session()->put('reference', $reference);
        }

        $pageTitle   = 'Home';
        $sections    = Page::where('tempname', activeTemplate())->where('slug', '/')->first();
        $seoContents = $sections->seo_content;
        $seoImage    = @$seoContents->image ? getImage(getFilePath('seo') . '/' . @$seoContents->image, getFileSize('seo')) : null;
        return view('Template::home', compact('pageTitle', 'sections', 'seoContents', 'seoImage'));
    }

    public function pages($slug)
    {
        $page        = Page::where('tempname', activeTemplate())->where('slug', $slug)->firstOrFail();
        $pageTitle   = $page->name;
        $sections    = $page->secs;
        $seoContents = $page->seo_content;
        $seoImage    = @$seoContents->image ? getImage(getFilePath('seo') . '/' . @$seoContents->image, getFileSize('seo')) : null;
        return view('Template::pages', compact('pageTitle', 'sections', 'seoContents', 'seoImage'));
    }


    public function accommodation($categoryId = null)
    {
        $page        = Page::where('tempname', activeTemplate())->where('slug', 'accommodation')->firstOrFail();
        $pageTitle   = $page->name;
        $sections    = $page->secs;
        $seoContents = $page->seo_content;
        $seoImage    = @$seoContents->image ? getImage(getFilePath('seo') . '/' . @$seoContents->image, getFileSize('seo')) : null;

        $rooms = Room::where('status', 1);
        if ($categoryId) {
            $rooms->where('category_id', $categoryId);
            $category = CategoryRoom::withTranslation()->find($categoryId);
            if ($category) {
                $pageTitle = $category->getTranslation()->name;
            }
        }

        $rooms = $rooms->with(['translations', 'images' => function ($query) {
            $query->where('type', 2);
        }])
            ->orderBy('sort_order', 'asc')
            ->orderBy('id', 'desc')
            ->get();

        $breadcrumb_mapping = [
            'Accommodation' => __('Accommodation'),
        ];

        return view('Template::accommodation', compact('pageTitle', 'sections', 'seoContents', 'seoImage', 'breadcrumb_mapping', 'rooms'));
    }
    public function specialOffers($categoryId = null)
    {
        $page        = Page::where('tempname', activeTemplate())->where('slug', 'special-offers')->firstOrFail();
        $pageTitle   = $page->name;
        $sections    = $page->secs;
        $seoContents = $page->seo_content;
        $seoImage    = @$seoContents->image ? getImage(getFilePath('seo') . '/' . @$seoContents->image, getFileSize('seo')) : null;

        $specialOffers = SpecialOffer::where('status', 1);
        if ($categoryId) {
            $specialOffers->where('category_id', $categoryId);
            $category = CategoryRoom::withTranslation()->find($categoryId);
            if ($category) {
                $pageTitle = $category->getTranslation()->name;
            }
        }

        $specialOffers = $specialOffers->with(['translations', 'images' => function ($query) {
            $query->where('type', 2);
        }])
            ->orderBy('sort_order', 'asc')
            ->orderBy('id', 'desc')
            ->get();

        $breadcrumb_mapping = [
            'Special Offers' => __('Special Offers'),
        ];

        return view('Template::special_offers', compact('pageTitle', 'sections', 'seoContents', 'seoImage', 'breadcrumb_mapping', 'specialOffers'));
    }


    public function meetingEvents($categoryId = null)
    {
        $page        = Page::where('tempname', activeTemplate())->where('slug', 'metting-events')->firstOrFail();
        $pageTitle   = $page->name;
        $sections    = $page->secs;
        $seoContents = $page->seo_content;
        $seoImage    = @$seoContents->image ? getImage(getFilePath('seo') . '/' . @$seoContents->image, getFileSize('seo')) : null;

        $meetingEvents = MiceEvent::where('status', 1)
            ->with(['translations'])
            ->orderBy('sort_order', 'asc')
            ->orderBy('id', 'desc')
            ->get();

        $breadcrumb_mapping = [
            'Meeting & Events' => __('Meeting & Events'),
        ];

        return view('Template::meeting_events', compact('pageTitle', 'sections', 'seoContents', 'seoImage', 'breadcrumb_mapping', 'meetingEvents'));
    }


    public function travelGuide($categoryId = null)
    {
        $page        = Page::where('tempname', activeTemplate())->where('slug', 'travel-guide')->firstOrFail();
        $pageTitle   = $page->name;
        $sections    = $page->secs;
        $seoContents = $page->seo_content;
        $seoImage    = @$seoContents->image ? getImage(getFilePath('seo') . '/' . @$seoContents->image, getFileSize('seo')) : null;

        $posts = Post::where('status', 1)
            ->with(['translations'])
            ->orderBy('sort_order', 'asc')
            ->orderBy('id', 'desc')
            ->paginate(6);

        $breadcrumb_mapping = [
            'Travel & Guide' => __('Travel & Guide'),
        ];

        return view('Template::travel_guide', compact('pageTitle', 'sections', 'seoContents', 'seoImage', 'breadcrumb_mapping', 'posts'));
    }
    public function contact()
    {
        $pageTitle   = "Contact";
        $sections    = Page::where('tempname', activeTemplate())->where('slug', 'contact')->first();
        $seoContents = $sections->seo_content;
        $seoImage    = @$seoContents->image ? getImage(getFilePath('seo') . '/' . @$seoContents->image, getFileSize('seo')) : null;
        return view('Template::contact', compact('pageTitle', 'sections', 'seoContents', 'seoImage'));
    }



    public function contactSubmit(Request $request)
    {
        $request->validate([
            'name'    => 'required',
            'email'   => 'required',
            'subject' => 'required|string|max:255',
            'message' => 'required',
        ]);

        $request->session()->regenerateToken();

        if (!verifyCaptcha()) {
            $notify[] = ['error', 'Invalid captcha provided'];
            return back()->withNotify($notify);
        }

        $random = getNumber();

        $ticket             = new SupportTicket();
        $ticket->user_id    = auth()->id() ?? 0;
        $ticket->name       = $request->name;
        $ticket->email      = $request->email;
        $ticket->priority   = Status::PRIORITY_MEDIUM;
        $ticket->ticket     = $random;
        $ticket->subject    = $request->subject;
        $ticket->last_reply = Carbon::now();
        $ticket->status     = Status::TICKET_OPEN;
        $ticket->save();

        $adminNotification            = new AdminNotification();
        $adminNotification->user_id   = authUser() ? authUser()->id : 0;
        $adminNotification->title     = 'A new contact message has been submitted';
        $adminNotification->click_url = urlPath('admin.ticket.view', $ticket->id);
        $adminNotification->save();

        $message                    = new SupportMessage();
        $message->support_ticket_id = $ticket->id;
        $message->message           = $request->message;
        $message->save();

        $notify[] = ['success', 'Ticket created successfully!'];
        return to_route('ticket.view', [$ticket->ticket])->withNotify($notify);
    }

    public function policyPages($slug)
    {
        $policy = Frontend::where('tempname', activeTemplateName())->where('slug', $slug)->where('data_keys', 'policy_pages.element')->firstOrFail();
        $pageTitle   = $policy->data_values->title;
        $seoContents = $policy->seo_content;
        $seoImage    = @$seoContents->image ? frontendImage('policy_pages', $seoContents->image, getFileSize('seo'), true) : null;
        return view('Template::policy', compact('policy', 'pageTitle', 'seoContents', 'seoImage'));
    }

    public function changeLanguage($lang = null)
    {
        $language = Language::where('code', $lang)->first();
        if (!$language) {
            $lang = 'en';
        }
        session()->put('lang', $lang);
        return back();
    }

    public function blog($categoryId = null)
    {
        $pageTitle   = "Blog";
        $blogs       = Frontend::where('data_keys', 'blog.element')->orderBy('id', 'desc');

        // Note: Frontend elements don't easily filter by Post Category ID 
        // unless they are linked. Assuming user wants to filter if possible.

        $blogs = $blogs->paginate(getPaginate());

        $page        = Page::where('tempname', activeTemplate())->where('slug', 'blog')->firstOrFail();
        $seoContents = $page->seo_content;
        $seoImage    = @$seoContents->image ? frontendImage('blog', $seoContents->image, getFileSize('seo'), true) : null;
        return view('Template::blog', compact('blogs', 'pageTitle', 'page'));
    }



    public function blogDetails($slug)
    {
        $blog        = Frontend::where('slug', $slug)->where('data_keys', 'blog.element')->firstOrFail();
        $pageTitle   = 'Blog Detail';
        $seoContents = $blog->seo_content;
        $seoImage    = @$seoContents->image ? frontendImage('blog', $seoContents->image, getFileSize('seo'), true) : null;
        $recentBlogs = Frontend::where('slug', '!=', $slug)->where('data_keys', 'blog.element')->orderby('id', 'DESC')->limit(8)->get();
        return view('Template::blog_details', compact('blog', 'pageTitle', 'seoContents', 'seoImage', 'recentBlogs'));
    }

    public function cookieAccept()
    {
        Cookie::queue('gdpr_cookie', gs('site_name'), 43200);
    }

    public function cookiePolicy()
    {
        $cookieContent = Frontend::where('data_keys', 'cookie.data')->first();
        abort_if($cookieContent->data_values->status != Status::ENABLE, 404);
        $pageTitle = 'Cookie Policy';
        $cookie    = Frontend::where('data_keys', 'cookie.data')->first();
        return view('Template::cookie', compact('pageTitle', 'cookie'));
    }

    public function placeholderImage($size = null)
    {
        $imgWidth  = explode('x', $size)[0];
        $imgHeight = explode('x', $size)[1];
        $text      = $imgWidth . '×' . $imgHeight;
        $fontFile  = realpath('assets/font/solaimanLipi_bold.ttf');

        $fontSize = round(($imgWidth - 50) / 8);
        if ($fontSize <= 9) {
            $fontSize = 9;
        }
        if ($imgHeight < 100 && $fontSize > 30) {
            $fontSize = 30;
        }

        $image = imagecreatetruecolor($imgWidth, $imgHeight);

        $colorFill = imagecolorallocate($image, 100, 100, 100);
        $bgFill    = imagecolorallocate($image, 255, 255, 255);
        imagefill($image, 0, 0, $bgFill);
        $textBox    = imagettfbbox($fontSize, 0, $fontFile, $text);
        $textWidth  = abs($textBox[4] - $textBox[0]);
        $textHeight = abs($textBox[5] - $textBox[1]);
        $textX      = ($imgWidth - $textWidth) / 2;
        $textY      = ($imgHeight + $textHeight) / 2;
        header('Content-Type: image/jpeg');
        imagettftext($image, $fontSize, 0, $textX, $textY, $colorFill, $fontFile, $text);
        imagejpeg($image);
        imagedestroy($image);
    }

    public function maintenance()
    {
        $pageTitle = 'Maintenance Mode';
        if (gs('maintenance_mode') == Status::DISABLE) {
            return to_route('home');
        }
        $maintenance = Frontend::where('data_keys', 'maintenance.data')->first();
        return view('Template::maintenance', compact('pageTitle', 'maintenance'));
    }


    public function addSubscriber(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255|unique:subscribers,email',
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()->all()]);
        }
        $subscriber        = new Subscriber();
        $subscriber->email = $request->email;
        $subscriber->save();

        return response()->json(['success' => true, 'message' => 'Subscribed successfully']);
    }

    public function checkKey($slug)
    {
        $key = Key::where('slug', $slug)->first();

        if (!$key) {
            // Fallback for default pages or hardcoded slugs
            $page = Page::where('tempname', activeTemplate())->where('slug', $slug)->first();
            if ($page) {
                return $this->pages($slug);
            }
            abort(404);
        }

        // Handle Listing/Special types first
        switch ($key->type) {
            case Key::TYPE_PAGE:
                return $this->pages($key->slug);
                // case Key::TYPE_CATEGORY_POST:
                //     return $this->blog($key->key_id);
                // case Key::TYPE_CATEGORY_ROOM:
                //     return $this->accommodation($key->key_id);
        }

        // Handle Details types using Service
        $details = $this->contentService->getDetails($key);
        if ($details) {
            return view($details['view'], [
                'item'               => $details['item'],
                $details['variable'] => $details['item'],
                'pageTitle'          => $details['pageTitle'],
                'crumbs'             => $details['breadcrumbs'],
                'image_folder'       => $details['image_folder']
            ]);
        }

        abort(404);
    }
}
