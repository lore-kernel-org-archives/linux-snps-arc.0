From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 17 Jun 2016 16:30:43 +0200
Subject: [PATCH V3] clocksource/drivers/arc: Convert init function to
 return error
In-Reply-To: <1466158167-23126-1-git-send-email-daniel.lezcano@linaro.org>
References: <5763BC00.1030101@synopsys.com>
 <1466158167-23126-1-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57640993.5070505@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 17 June 2016 12:09 PM, Daniel Lezcano wrote:
> The init functions do not return any error. They behave as the following:
> 
>   - panic, thus leading to a kernel crash while another timer may work and
>        make the system boot up correctly
> 
>   or
> 
>   - print an error and let the caller unaware if the state of the system
> 
> Change that by converting the init functions to return an error conforming
> to the CLOCKSOURCE_OF_RET prototype.
> 
> Proper error handling (rollback, errno value) will be changed later case
> by case, thus this change just return back an error or success in the init
> function.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano at linaro.org>

Acked-by: Vineet Gupta <vgupta at synopsys.com>

P.S. It would be nice to get cover letter for a series in addition to relevant
patches for full context, although per prev discussion on ARC timers, I kind of
knew what the idea was !
