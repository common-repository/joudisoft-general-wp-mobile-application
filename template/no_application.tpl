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
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="panel panel-primary">
                <div class="panel-heading  bg-blue-gradient">
                    <h3 class="panel-title text-bold text-center">Welcome to joudiSoft Application Box</h3>
                </div>
                <div class="panel-body">
                    <div class="col-md-12 col-sm-12 col-xs-12 text-center">
                      <div class="center-image">
                        <img class="img-responsive" src="{$AWP.plugin.plugin_url}/assets/img/appbox_gl.png">
                      </div>
                      <div class="btn-group btn-group-lg text-center">
                          <button type="button" class="btn btn-success" onclick="jQuery('#application-create-modal').modal('show');">
                              <i class="fa fa-plus fw-rl10"></i>Create New Application
                          </button>
                          <button type="button" class="btn btn-primary" onclick="jQuery('#application-transfer-modal').modal('show');">
                              <i class="fa fa-exchange fw-rl10"></i>Transfer My Application
                          </button>
                          <a class="btn btn-default" target="_blank" href="https://docs.joudisoft.com/application-box/wordpress-general/">
                            <i class="fa fa-info fw-rl10"></i>Learn More</a>
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{% parts/modals/no_application.tpl %}
{% parts/footer.tpl %}
