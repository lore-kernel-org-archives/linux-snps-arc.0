From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Fri, 11 Nov 2016 09:13:00 -0800
Subject: [PATCH v2 00/11] getting back -Wmaybe-uninitialized
In-Reply-To: <20161110164454.293477-1-arnd@arndb.de>
References: <20161110164454.293477-1-arnd@arndb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CA+55aFx_scFVFKU__TBmoffw_iHvrdAU2dj5u1WKfWJXAkS4QA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Nov 10, 2016@8:44 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>
> Please merge these directly if you are happy with the result.

I will take this.

I do see two warnings, but they both seem to be valid and recent,
though, so I have no issues with the spurious cases.

Warning #1:

  sound/soc/qcom/lpass-platform.c: In function ?lpass_platform_pcmops_open?:
  sound/soc/qcom/lpass-platform.c:83:29: warning: ?dma_ch? may be used
uninitialized in this function [-Wmaybe-uninitialized]
    drvdata->substream[dma_ch] = substream;
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~

and 'dma_ch' usage there really is crazy and wrong. Broken by
022d00ee0b55 ("ASoC: lpass-platform: Fix broken pcm data usage")

Warning #2 is not a real bug, but it's reasonable that gcc doesn't
know that storage_bytes (chip->read_size) has to be 2/4. Again,
introduced recently by commit 231147ee77f3 ("iio: maxim_thermocouple:
Align 16 bit big endian value of raw reads"), so you didn't see it.

  drivers/iio/temperature/maxim_thermocouple.c: In function
?maxim_thermocouple_read_raw?:
  drivers/iio/temperature/maxim_thermocouple.c:141:5: warning: ?ret?
may be used uninitialized in this function [-Wmaybe-uninitialized]
    if (ret)
       ^
  drivers/iio/temperature/maxim_thermocouple.c:128:6: note: ?ret? was
declared here
    int ret;
        ^~~

and I guess that code can just initialize 'ret' to '-EINVAL' or
something to just make the theoretical "somehow we had a wrong
chip->read_size" case error out cleanly.

                Linus
