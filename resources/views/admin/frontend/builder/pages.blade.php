@extends('admin.layouts.app')
@use('App\Constants\Status')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light style--two custom-data-table">
                            <thead>
                            <tr>
                                <th>@lang('Name')</th>
                                <th>@lang('Slug')</th>
                                <th>@lang('Action')</th>
                            </tr>
                            </thead>
                            <tbody>
                            @forelse($pData as $k => $data)
                                <tr>
                                    <td>{{ __($data->name) }}</td>
                                    <td>{{ __($data->slug) }}</td>
                                    <td>
                                        <div class="button--group">
                                            <a href="{{ route('admin.frontend.manage.pages.seo',$data->id) }}" class="btn btn-sm btn-outline--info"><i class="la la-cog"></i> @lang('SEO Setting')</a>
                                            <button class="btn btn-sm btn-outline--warning editBtn" 
                                                data-id="{{ $data->id }}" 
                                                data-name="{{ $data->name }}" 
                                                data-slug="{{ $data->slug }}"
                                                @foreach($languages as $lang)
                                                    @php $trans = $data->translations->where('lang_code', $lang->code)->first(); @endphp
                                                    data-trans-{{ $lang->code }}="{{ @$trans->name }}"
                                                @endforeach
                                            >
                                                <i class="la la-edit"></i> @lang('Edit Name')
                                            </button>
                                            <a href="{{ route('admin.frontend.manage.section', $data->id) }}" class="btn btn-sm btn-outline--primary"><i class="la la-pen"></i> @lang('Edit Sections')</a>
                                            @if($data->is_default == Status::NO)
                                                <button class="btn btn-sm btn-outline--danger confirmationBtn"
                                                data-action="{{ route('admin.frontend.manage.pages.delete',$data->id) }}"
                                                data-question="@lang('Are you sure to remove this page?')">
                                                    <i class="las la-trash"></i> @lang('Delete')
                                                </button>
                                            @endif
                                        </div>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                </tr>
                            @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="addModal" class="modal fade">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> @lang('Add New Page')</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{ route('admin.frontend.manage.pages.save')}}" class="disableSubmission" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="card mb-3">
                            <div class="card-header bg--dark p-1">
                                <ul class="nav nav-tabs card-header-tabs border-0" id="addTab" role="tablist">
                                    @foreach($languages as $lang)
                                        <li class="nav-item">
                                            <a class="nav-link {{ $loop->first ? 'active' : '' }} py-1 px-2 border-0 text-white" id="add-{{ $lang->code }}-tab" data-bs-toggle="tab" href="#add-{{ $lang->code }}" role="tab">
                                                {{ __($lang->name) }}
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                            <div class="card-body p-2">
                                <div class="tab-content" id="addTabContent">
                                    @foreach($languages as $lang)
                                        <div class="tab-pane fade {{ $loop->first ? 'show active' : '' }}" id="add-{{ $lang->code }}" role="tabpanel">
                                            <div class="form-group mb-0">
                                                <label class="required small">@lang('Page Name') ({{ strtoupper($lang->code) }})</label>
                                                <input type="text" class="form-control form-control-sm" name="translations[{{ $lang->code }}][name]" required>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="d-flex justify-content-between">
                                <label> @lang('Page Name (Default)')</label>
                                <a href="javascript:void(0)" class="buildSlug"><i class="las la-link"></i> @lang('Make Slug')</a>
                            </div>
                            <input type="text" class="form-control" name="name" value="{{old('name')}}" required placeholder="@lang('System fallback')">
                        </div>
                        <div class="form-group">
                            <div class="d-flex justify-content-between">
                                <label> @lang('Slug')</label>
                                <div class="slug-verification d-none"></div>
                            </div>
                            <input type="text" class="form-control" name="slug" value="{{old('slug')}}" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary w-100 h-45 disabled">@lang('Submit')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div id="editModal" class="modal fade">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> @lang('Edit Page')</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{ route('admin.frontend.manage.pages.update')}}" class="disableSubmission" method="POST">
                    @csrf
                    <input type="hidden" name="id">
                    <div class="modal-body">
                        <div class="card mb-3">
                            <div class="card-header bg--dark p-1">
                                <ul class="nav nav-tabs card-header-tabs border-0" id="editTab" role="tablist">
                                    @foreach($languages as $lang)
                                        <li class="nav-item">
                                            <a class="nav-link {{ $loop->first ? 'active' : '' }} py-1 px-2 border-0 text-white" id="edit-{{ $lang->code }}-tab" data-bs-toggle="tab" href="#edit-{{ $lang->code }}" role="tab">
                                                {{ __($lang->name) }}
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                            <div class="card-body p-2">
                                <div class="tab-content" id="editTabContent">
                                    @foreach($languages as $lang)
                                        <div class="tab-pane fade {{ $loop->first ? 'show active' : '' }}" id="edit-{{ $lang->code }}" role="tabpanel">
                                            <div class="form-group mb-0">
                                                <label class="required small">@lang('Page Name') ({{ strtoupper($lang->code) }})</label>
                                                <input type="text" class="form-control form-control-sm" name="translations[{{ $lang->code }}][name]" required>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="d-flex justify-content-between">
                                <label> @lang('Page Name (Default)')</label>
                                <a href="javascript:void(0)" class="buildSlug"><i class="las la-link"></i> @lang('Make Slug')</a>
                            </div>
                            <input type="text" class="form-control" name="name" required>
                        </div>
                        <div class="form-group">
                            <div class="d-flex justify-content-between">
                                <label> @lang('Slug')</label>
                                <div class="slug-verification d-none"></div>
                            </div>
                            <input type="text" class="form-control" name="slug" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('Submit')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <button type="button" class="btn btn-sm btn-outline--primary addBtn"><i class="las la-plus"></i>@lang('Add New')</button>
@endpush

@push('script')

    <script>
        (function ($) {
            "use strict";

            $('.addBtn').on('click', function () {
                var modal = $('#addModal');
                modal.modal('show');
            });

            $('.editBtn').on('click', function () {
                var modal = $('#editModal');
                modal.find('input[name=id]').val($(this).data('id'));
                modal.find('input[name=name]').val($(this).data('name'));
                modal.find('input[name=slug]').val($(this).data('slug'));
                
                @foreach($languages as $lang)
                    modal.find('input[name="translations[{{ $lang->code }}][name]"]').val($(this).data('trans-{{ $lang->code }}'));
                @endforeach

                modal.modal('show');
            });

            $('.buildSlug').on('click',function(){
                let closestForm = $(this).closest('form');
                let title = closestForm.find('[name=name]').val();
                closestForm.find('[name=slug]').val(title);
                closestForm.find('[name=slug]').trigger('input');
            });

            $('[name=slug]').on('input',function(){
                let closestForm = $(this).closest('form');
                closestForm.find('[type=submit]').addClass('disabled')
                let slug = $(this).val();
                slug = slug.toLowerCase().replace(/ /g,'-').replace(/[^\w-]+/g,'');
                $(this).val(slug);
                if (slug) {
                    $('.slug-verification').removeClass('d-none');
                    $('.slug-verification').html(`
                        <small class="text--info"><i class="las la-spinner la-spin"></i> @lang('Checking')</small>
                    `);
                    $.get("{{ route('admin.frontend.manage.pages.check.slug') }}", {slug:slug},function(response){
                        if (!response.exists) {
                            $('.slug-verification').html(`
                                <small class="text--success"><i class="las la-check"></i> @lang('Available')</small>
                            `);
                            closestForm.find('[type=submit]').removeClass('disabled')
                        }
                        if (response.exists) {
                            $('.slug-verification').html(`
                                <small class="text--danger"><i class="las la-times"></i> @lang('Slug already exists')</small>
                            `);
                        }
                    });
                }else{
                    $('.slug-verification').addClass('d-none');
                }
            })

        })(jQuery);

    </script>

@endpush
