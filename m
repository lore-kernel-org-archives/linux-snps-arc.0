From: patrice.chotard@st.com (Patrice Chotard)
Date: Mon, 20 Jun 2016 09:43:21 +0200
Subject: [PATCH V2 63/63] clocksources: Switch back to the clksrc table
In-Reply-To: <1466112442-31105-64-git-send-email-daniel.lezcano@linaro.org>
References: <1466112442-31105-1-git-send-email-daniel.lezcano@linaro.org>
 <1466112442-31105-64-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57679E99.6090607@st.com>
To: linux-snps-arc@lists.infradead.org



On 06/16/2016 11:27 PM, Daniel Lezcano wrote:
> All the clocksource drivers's init function are now converted to return
> an error code. CLOCKSOURCE_OF_DECLARE is no longer used as well as the
> clksrc-of table.
>
> Let's convert back the names:
>   - CLOCKSOURCE_OF_DECLARE_RET => CLOCKSOURCE_OF_DECLARE
>   - clksrc-of-ret              => clksrc-of
>
>
>   drivers/clocksource/clksrc_st_lpc.c       |  2 +-
> diff --git a/drivers/clocksource/clksrc_st_lpc.c b/drivers/clocksource/clksrc_st_lpc.c
> index c9022a9..03cc492 100644
> --- a/drivers/clocksource/clksrc_st_lpc.c
> +++ b/drivers/clocksource/clksrc_st_lpc.c
> @@ -132,4 +132,4 @@ static int __init st_clksrc_of_register(struct device_node *np)
>   
>   	return ret;
>   }
> -CLOCKSOURCE_OF_DECLARE_RET(ddata, "st,stih407-lpc", st_clksrc_of_register);
> +CLOCKSOURCE_OF_DECLARE(ddata, "st,stih407-lpc", st_clksrc_of_register);
>


For STi :

Acked-by: Patrice Chotard <patrice.chotard at st.com>

Thanks
