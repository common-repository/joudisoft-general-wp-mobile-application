{% parts/header.tpl %}
    ?$NOTICES
      <div class="row">
          <div class="col-md-offset-1 col-md-10 col-sm-12 col-xs-12">
            [$NOTICES]
                <p class="alert alert-{$type} font-16">{$text}</p>
            [/$NOTICES]
          </div>
      </div>
    $NOTICES?
    <div class="row">
        <div class="col-md-8 col-sm-7 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading bg-green-gradient">
                    <h3 class="panel-title text-bold"><i class="fa fa-cog fw-rl10"></i>Application Control</h3>
                </div>
                <div class="panel-body">
                    <div class="col-md-12">
                        <div id="exTab2" class="row">
                            <ul class="nav nav-tabs">
                                <li class="active"><a  href="#control_overview" data-toggle="tab">
                                  <i class="fa fa-info fw-rl10"></i>Overview</a></li>
                                <li><a href="#control_appearance" data-toggle="tab">
                                  <i class="fa fa-adjust fw-rl10"></i>Appearance</a></li>
                                <li><a href="#control_notification" data-toggle="tab"><i class="fa fa-bell fw-rl10"></i>Notifications</a></li>
                                <li><a href="#control_builder" data-toggle="tab">
                                  <i class="fa fa-cogs fw-rl10"></i>Builder</a></li>
                                <li><a href="#control_license" data-toggle="tab">
                                  <i class="fa fa-barcode fw-rl10"></i>License</a></li>
                            </ul>

                            <div class="tab-content pad-t-20">
                                <div class="tab-pane active" id="control_overview">
                                    {% parts/views/application_overview.tpl %}
                                </div>
                                <div class="tab-pane" id="control_appearance">
                                    {% parts/views/application_appearance.tpl %}
                                </div>
                                <div class="tab-pane" id="control_notification">
                                    {% parts/views/application_notifications_new.tpl %}
                                    {% parts/views/application_notifications_count.tpl %}
                                </div>
                                <div class="tab-pane" id="control_builder">
                                    {% parts/views/application_builder.tpl %}
                                </div>
                                <div class="tab-pane" id="control_license">
                                    {% parts/views/application_license.tpl %}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-5 col-xs-12">
            {% parts/views/application_preview.tpl %}
        </div>
    </div>
{% parts/footer.tpl %}
