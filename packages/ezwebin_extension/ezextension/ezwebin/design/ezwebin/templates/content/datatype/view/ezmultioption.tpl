
<div class="block">
{$attribute.content.name}
</div>

{section var=Multioptions loop=$attribute.content.multioption_list sequence=array( bglight, bgdark )}
<div class="block">
<label>{$Multioptions.item.name}:</label>
<select name="eZOption[{$attribute.id}][]">
    {section var=Option loop=$Multioptions.item.optionlist}
            {section show=ne( $Option.item.additional_price, '' )}
                {section show=eq( sum( $Option.index, 1 ), $Multioptions.item.default_option_id )}
                    <option value="{$Option.item.option_id}" selected="selected">{$Option.item.value}-{$Option.item.additional_price|l10n( currency )}</option>
                {section-else}
                    <option value="{$Option.item.option_id}">{$Option.item.value}-{$Option.item.additional_price|l10n( currency )}</option>
                {/section}
            {section-else}
                {section show=eq(sum($Option.index,1), $Multioptions.item.default_option_id)}
                    <option value="{$Option.item.option_id}" selected="selected">{$Option.item.value}</option>
                {section-else}
                    <option value="{$Option.item.option_id}">{$Option.item.value}</option>
                {/section}
            {/section}
        {/section}
    </select>
</div>
{/section}