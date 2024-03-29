{if $usertype eq 'A'}
<h1>{$module_data.module_name}</h1>

{$lng.txt_cc_configure_top_text}

<br />
<br />

{capture name=dialog}
<form action="cc_processing.php?cc_processor={$smarty.get.cc_processor|escape:" url"}" method="post">

  <table cellspacing="10">

    <tr>
      <td>{$lng.lbl_lunar_app_key}:</td>
      <td><input type="text" name="param01" size="70" required value="{$module_data.param01|escape}" /></td>
    </tr>

    <tr>
      <td>{$lng.lbl_lunar_public_key}:</td>
      <td><input type="text" name="param02" size="70" required value="{$module_data.param02|escape}" /></td>
    </tr>

    <tr>
      <td>{$lng.lbl_lunar_logo_url}:</td>
      <td><input type="text" name="param03" size="70" required value="{$module_data.param03|escape}" /></td>
    </tr>

    {if $module_data.param08 == 'mobilePay'}
      <tr>
        <td>{$lng.lbl_lunar_configuration_id}:</td>
        <td><input type="text" name="param04" size="70" required value="{$module_data.param04|escape}" /></td>
      </tr>

      <tr>
        <td>{$lng.lbl_lunar_payment_title}:</td>
        <td>
          <input type="text" name="param06" disabled size="40" value="{$lng.lbl_lunar_mobilepay_title_text}" />
          <label>{$lng.lbl_lunar_mobilepay_title_link|substitute:"shop_language":$shop_language}</label>
        </td>
      </tr>

      <tr>
        <td>{$lng.lbl_lunar_payment_description}:</td>
        <td>
          <input type="text" name="param07" disabled size="40" value="{$lng.lbl_lunar_mobilepay_description_text}" />
          <label>{$lng.lbl_lunar_mobilepay_description_link|substitute:"shop_language":$shop_language}</label>
        </td>
      </tr>

    {else}

    <tr>
      <td>{$lng.lbl_lunar_payment_title}:</td>
      <td>
        <input type="text" name="param06" disabled size="40" value="{$lng.lbl_lunar_card_title_text}" />
        <label>{$lng.lbl_lunar_card_title_link|substitute:"shop_language":$shop_language}</label>
      </td>
    </tr>

    <tr>
      <td>{$lng.lbl_lunar_payment_description}:</td>
      <td>
        <input type="text" name="param07" disabled size="40" value="{$lng.lbl_lunar_card_description_text}" />
        <label>{$lng.lbl_lunar_card_description_link|substitute:"shop_language":$shop_language}</label>
      </td>
    </tr>
    {/if}

    <tr>
      <td>{$lng.lbl_lunar_checkout_mode_label}</td>
      <td>
        <select name="use_preauth">
          <option value="Y" {if $module_data.use_preauth eq 'Y' } selected="selected" {/if}>
            {$lng.lbl_auth_method}
          </option>
          <option value="" {if $module_data.use_preauth eq '' } selected="selected" {/if}>
            {$lng.lbl_auth_and_capture_method}
          </option>
        </select>
        ({$lng.lbl_use_preauth_method})
      </td>
    </tr>

    <tr>
      <td>{$lng.lbl_lunar_currency}:</td>
      <td>
        <select name="param09">
          {if $currencies}
            {foreach item=currency from=$currencies}
              <option value="{$currency.code}" {if $module_data.param09 eq $currency.code } selected="selected" {/if}>
                {$currency.code}
              </option>
            {/foreach}
          {/if}
        </select>
        (The currency used when the customer pay for an order)
      </td>
    </tr>

  </table>
  <br /><br />
  <input type="submit" value="{$lng.lbl_update|strip_tags:false|escape}" />
</form>
{/capture}

{include file="dialog.tpl" title=$lng.lbl_ch_settings content=$smarty.capture.dialog extra='width="100%"'}

{else}
  {$lng.lbl_lunar_cc_info}
{/if}