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
                <i class="fa fa-warning fw-rl10"></i>Plugin / Website URL Change Detected
              </h3>
              <p class="font-16 text-bold line-height-2em pad-b-10">
                We've detected a major change at your website or plugin URL(s)<br>
                It requires a procedure must be taken to restore your application fully working
              </p>
              <h3 class="text-bold"><strong>1.</strong> Save your transfer key</h3>
              ?$AWP.sets.application.transfer_key
                <div class="transfer-key-plugin-changed">
                  {$AWP.sets.application.transfer_key}
                </div>
              $AWP.sets.application.transfer_key?
              <h3 class="text-bold"><strong>2.</strong> Reset plugin data</h3>
              <p class="font-18 line-height-2em pad-b-10">
                After reseting your plugin saved data you can use your transfer key to restore your application
              </p>
              <label class="btn btn-danger btn-lg btn-block auto-margin" role="button">
                <form class="" method="post" action="">
                  <input type="hidden" name="ab_operation" value="full_reset">
                  <i class="fa fa-repeat fw-rl10"></i> Perform Full Reset
                  <input type="submit" class="hidden">
                </form>
              </label>
            </div>
        </div>
    </div>
<script>setTimeout(function(){window.location.reload();}, 120000);</script>
{% parts/footer.tpl %}
