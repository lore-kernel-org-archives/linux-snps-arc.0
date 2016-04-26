From: linus.walleij@linaro.org (Linus Walleij)
Date: Tue, 26 Apr 2016 14:09:14 +0200
Subject: [PATCH 02/23] arc: select GPIOLIB directly
In-Reply-To: <5719B3A0.4060001@synopsys.com>
References: <1461142701-21096-1-git-send-email-linus.walleij@linaro.org>
 <1461142701-21096-3-git-send-email-linus.walleij@linaro.org>
 <5719B3A0.4060001@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CACRpkdYABvUtAjjzokNStDEaN=vViF5X7b_bhGsmgNFb9K62gQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Apr 22, 2016 at 7:16 AM, Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
> On Wednesday 20 April 2016 02:28 PM, Linus Walleij wrote:
>> Instead of indirectly selecting GPIOLIB via the
>> ARCH_REQUIRE_GPIOLIB symbol, just select GPIOLIB.
>>
>> Cc: Michael B?sch <m at bues.ch>
>> Cc: Vineet Gupta <vgupta at synopsys.com>
>> Cc: linux-snps-arc at lists.infradead.org
>> Signed-off-by: Linus Walleij <linus.walleij at linaro.org>
>> ---
>> Various arch maintainers:
>
> It would be nice to get the cover latter as well to get more context. The whole
> series didn't seem to be CCed to lkml either.

Sorry for that.

> Anyhow I found some reference on
> linux-gpio patchworks and seems like a nice cleanup.
>
> So for arch/arc/*
>
> Acked-by: Vineet Gupta <vgupt at synopsys.com>

Thanks, patch applied to the GPIO tree with your ACK.

Yours,
Linus Walleij
