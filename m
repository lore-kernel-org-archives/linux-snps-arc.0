From: noamc@ezchip.com (Noam Camus)
Date: Tue, 8 Dec 2015 13:00:23 +0000
Subject: [PATCH v3 03/18] clocksource: Add NPS400 timers driver
In-Reply-To: <56615927.30201@linaro.org>
References: <1448974985-11487-1-git-send-email-noamc@ezchip.com>
 <1448974985-11487-4-git-send-email-noamc@ezchip.com>
 <56615927.30201@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB114169D551B609CFC6F13E53D6080@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

From: Daniel Lezcano [mailto:daniel.lezcano@linaro.org] 
Sent: Friday, December 04, 2015 11:13 AM


>It would be cleaner to define a fixed clock and then add a phandle in the DT.

>	timer_clk: timer_clk {
>		#clock-cells = <0>;
>		compatible = "fixed-clock";
>		clock-frequency = <123456789>;
>	};

>	timer {
>		compatible = "ezchip,nps400-timer";
>		clocks = <&timer_clk>;
>	}

>That will result in the same code than the other drivers.

>	clk = of_clk_get(np, 0);
>	if (IS_ERR(clk)) {
>		pr_err("%s: invalid clock\n", np->full_name);
>		return;
>	}

>  	rate = clk_get_rate(clk);

Seem like my driver comes before "fixed-clock" driver so I failed since I got no clocksource provider.
How can this be solved?

-Noam
