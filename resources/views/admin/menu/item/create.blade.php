@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <form action="{{ route('admin.menu.item.store') }}" method="POST">
                    @csrf
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Menu Group')</label>
                                    <select name="menu_group_id" class="form-control" required id="menu_group_id">
                                        <option value="" disabled selected>@lang('Select One')</option>
                                        @foreach($groups as $group)
                                            <option value="{{ $group->id }}">{{ __($group->name) }} ({{ $group->location }})</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Parent Item')</label>
                                    <select name="parent_id" class="form-control" id="parent_id">
                                        <option value="0">@lang('Root')</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="card mt-3">
                                    <div class="card-header bg--dark">
                                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                                            @foreach($languages as $lang)
                                                <li class="nav-item">
                                                    <a class="nav-link {{ $loop->first ? 'active' : '' }}" id="{{ $lang->code }}-tab" data-bs-toggle="tab" href="#{{ $lang->code }}" role="tab" aria-controls="{{ $lang->code }}" aria-selected="{{ $loop->first ? 'true' : 'false' }}">
                                                        {{ __($lang->name) }}
                                                    </a>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                    <div class="card-body">
                                        <div class="tab-content" id="myTabContent">
                                            @foreach($languages as $lang)
                                                <div class="tab-pane fade {{ $loop->first ? 'show active' : '' }}" id="{{ $lang->code }}" role="tabpanel" aria-labelledby="{{ $lang->code }}-tab">
                                                    <div class="form-group">
                                                        <label class="required">@lang('Title') ({{ strtoupper($lang->code) }})</label>
                                                        <input type="text" class="form-control" name="translations[{{ $lang->code }}][name]" required>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mt-3">
                                <div class="form-group">
                                    <label>@lang('Title (Default)')</label>
                                    <input type="text" name="title" class="form-control" required placeholder="@lang('For system fallback')">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('URL')</label>
                                    <input type="text" name="url" class="form-control" required placeholder="e.g. /, /about-us, #section">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Order')</label>
                                    <input type="number" name="order" class="form-control" value="0">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('Submit')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <x-back route="{{ route('admin.menu.item.index') }}" />
@endpush

@push('script')
    <script>
        (function($) {
            "use strict";
            $('#menu_group_id').on('change', function() {
                var groupId = $(this).val();
                $.ajax({
                    url: "{{ route('admin.menu.item.parents') }}",
                    data: { group_id: groupId },
                    success: function(response) {
                        var html = '<option value="0">@lang('Root')</option>';
                        $.each(response, function(index, item) {
                            html += `<option value="${item.id}">${item.title}</option>`;
                        });
                        $('#parent_id').html(html);
                    }
                });
            });
        })(jQuery);
    </script>
@endpush
