From: khilman@baylibre.com (Kevin Hilman)
Date: Tue, 27 Nov 2018 14:02:20 -0800
Subject: failing ARC builds in kernelCI
In-Reply-To: <2b7adbb0eeef90de6895889be814fd632e20a22f.camel@synopsys.com>
References: <CAOi56cX4sV=jD0ctuQROh3r8JtcL4285i-g8k7Ew3knnD3v8Ww@mail.gmail.com>
 <2b7adbb0eeef90de6895889be814fd632e20a22f.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7h8t1ekwlv.fsf@baylibre.com>
To: linux-snps-arc@lists.infradead.org

Alexey Brodkin <alexey.brodkin at synopsys.com> writes:

> Hi Kevin,
>
> On Tue, 2018-11-27@07:23 -0800, Kevin Hilman wrote:
>> Hi Alexey,
>> 
>> You may have noticed that some defconfigs are failing to build
>> upstream for ARC.  For example, on mainline, both allnoconfig and
>> tinyconfig fail to build[1].
>
> Actually I haven't seen that!
>  1. I used to check https://kernelci.org/soc/ but there's still no mention
>     of ARC so I thought builds for ARC are not enabled still.

Yeah, the /soc/ page is currently for boot results, not build results

>  2. I haven't seen any email notifications as well if they exist at all.

The list where all the general build/boot reports go is here[1], and
here's an example[2] showing the warnings/errors.

> That said it would be good if warning emails are sent to our mailing-list
> linux-snps-arc at lists.infradead.org (see in Cc as well) so somebody reacts on them.

Unfortunately, we don't have a way of sending arch-specific mails at the
moment.

>
>> Do you guys have any plans to fix these, or should we disable them?
>> We currently build these for all the other arches.,
>
> Sure, let me take a look right now.

Thanks,

Kevin

>> 
>> Kevin
>> 
>> [1] https://kernelci.org/build/mainline/branch/master/kernel/v4.20-rc4-7-gef78e5ec9214/
>
> -Alexey

[1] https://lists.linaro.org/mailman/listinfo/kernel-build-reports
[2] https://lists.linaro.org/pipermail/kernel-build-reports/2018-November/039387.html
