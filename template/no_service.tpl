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
            <div class="dis-block width-100per text-center">
              <div class="center-image">
                <img class="img-responsive" src="{$AWP.plugin.plugin_url}/assets/img/503.png">
              </div>
              <h3 class="mar-t-10 mar-b-20 text-bold text-red">
                <i class="fa fa-times fw-rl10"></i>Service Currently Unavailable
              </h3>
              <p class="font-16 text-bold text-black line-height-2em pad-b-10">If this error persists please check your website / server firewall it may prevents application box to access our API or <a target="_blank" href="https://joudisoft.com/contact/">contact joudiSoft</a> </p>
            </div>
        </div>
    </div>
<script>setTimeout(function(){window.location.reload();}, 120000);</script>
{% parts/footer.tpl %}
