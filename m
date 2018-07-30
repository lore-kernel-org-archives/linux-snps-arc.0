From: schwab@suse.de (Andreas Schwab)
Date: Mon, 30 Jul 2018 18:07:49 +0200
Subject: [PATCH] tst-tzset: raise timeout to 10 seconds
In-Reply-To: <alpine.DEB.2.20.1807301555590.17805@digraph.polyomino.org.uk>
 (Joseph Myers's message of "Mon, 30 Jul 2018 15:58:06 +0000")
References: <20180730152844.21999-1-abrodkin@synopsys.com>
 <alpine.DEB.2.20.1807301555590.17805@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <mvmmuu8vh9m.fsf@suse.de>
To: linux-snps-arc@lists.infradead.org

On Jul 30 2018, Joseph Myers <joseph@codesourcery.com> wrote:

> On Mon, 30 Jul 2018, Alexey Brodkin wrote:
>
>> diff --git a/timezone/tst-tzset.c b/timezone/tst-tzset.c
>> index 27f986b56dab..534f7acdf75f 100644
>> --- a/timezone/tst-tzset.c
>> +++ b/timezone/tst-tzset.c
>> @@ -25,7 +25,7 @@
>>  #include <time.h>
>>  #include <unistd.h>
>>  
>> -#define TIMEOUT 5
>> +#define TIMEOUT 10
>
> The timeout was set to 5 in commit 
> 112f28e88c4ea5afbd6050e71416a23db11e4adc to increase it from a default 2 
> seconds.  That was before the default timeout was changed to 20 seconds in 
> commit a28605b22946c708f0a5c4f06307e1a17650ced8.  In such cases I think we 
> should remove the timeout setting - explicit timeouts less than the 
> default are only appropriate where there is a strong reason to want to 
> *decrease* the default timeout.

There are a lot of tests that set TIMEOUT to less than 20.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
