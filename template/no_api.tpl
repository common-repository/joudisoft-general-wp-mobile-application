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
              <h3 class="mar-t-10 mar-b-20 text-bold text-orange">
                <i class="fa fa-warning fw-rl10"></i>Plugin Requires WP REST API
              </h3>
              <p class="font-16 text-bold line-height-2em pad-b-10">
                Our plugin requires your WordPress REST API to be enabled and accessable<br>
                You can resolve this issue by following the appropriate instructions from <a target="_blank" href="https://v2.wp-api.org/">The Official WP REST API Website</a>
              </p>
            </div>
        </div>
    </div>
<script>setTimeout(function(){window.location.reload();}, 120000);</script>
{% parts/footer.tpl %}
