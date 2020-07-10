Return-Path: <SRS0=2YWT=AV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88D2C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 20:33:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F1CD20748
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 20:33:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lc1a1w+x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VAxfHhQ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F1CD20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m/KpULzlQjoozFVsiAuKyBoblYap+NR3FQOOGC5lszo=; b=lc1a1w+xbqAQJ2Ygr9JoNPMmP
	6+P7+/vHmnmMDKwnrQtpd4ngXXP2ESA3OpSCZ7c9sSPoEEm8EJ7uNoaHTqL4xwYNJBKkeHySvYE6r
	38lK7ahH2nGt9sqIKp2apmJ10FrZOklcwwilGfVE99rtIG3ApQcNQlFJDdYEfvP8M4BFaK5LFRZ/r
	yijJxqst07xa06CcTjb8NkrTrIeIhgDbkJ855nlNQeDTH14P53BmsIUru0FEoA1EIvEvRWyUOI1nh
	p3iEgw+vlsTZHt3os0c7h4IQzVEjz5gd1l1ZwOEWJd4nGtol4cGBtNC2APjX/0OkseCDsFcapXmn8
	6q8OcBgDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtzhs-00034n-Nu; Fri, 10 Jul 2020 20:33:17 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtzhp-00033t-7h
 for linux-snps-arc@lists.infradead.org; Fri, 10 Jul 2020 20:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594413192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yaGOBqqHo1H90CdC6FWwdB0kg2TaCYJA+YnCe7iys2U=;
 b=VAxfHhQ/v1NBOmUk9iUI34cfwvwX8NSH85kwLxvkvTR9lqEZgy68BHAzZ76Gd9zoxLUJuc
 lhRHVh2ZqxH9utt+TTT5aL8rFQnkMb1yPQHDdNJ5fEFK7zbHqhynQ0A9VHTsFbdJqk5000
 3/7BCJFMSPUMUzf7RJmgrCeVXrvtbdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-uKMi7TVCO2KjdC3aTILxqw-1; Fri, 10 Jul 2020 16:33:10 -0400
X-MC-Unique: uKMi7TVCO2KjdC3aTILxqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA4521083;
 Fri, 10 Jul 2020 20:33:08 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-113-118.ams2.redhat.com
 [10.36.113.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D484E10013C4;
 Fri, 10 Jul 2020 20:33:07 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: ARC testsuite regressions (was Re: [PATCH v7.2 07/13] ARC: Linux
 Syscall Interface)
References: <8ec1c7a1-dd77-5f1f-a2a4-11d214152a0d@linaro.org>
 <20200707205506.31537-1-vgupta@synopsys.com>
 <b64d0df1-4229-d619-0ab1-ded287323775@linaro.org>
 <dce392e8-4e16-6a9e-d173-ea64ac375014@synopsys.com>
 <273d42de-dc2b-2101-8705-04b399bd46cc@linaro.org>
 <2c7b73bd-d738-6af8-90b0-514ad22d929f@synopsys.com>
 <130fbd5a-cec8-4930-0b5e-da53d8d582ea@synopsys.com>
 <5f20da5f-8612-099b-3257-56c18f10cfa0@synopsys.com>
 <CAKmqyKM4pgF=E6bzCdFqYkboGQWURjcVmAz-V5KVqTZts8otug@mail.gmail.com>
 <87o8on4t38.fsf@oldenburg2.str.redhat.com>
 <cf8e41c7-8a58-f9bc-ab6a-ca5099bf6b46@synopsys.com>
 <CAKmqyKMoq7A_n-i8ho-RSLK_0zu-eipxcOj9xJfFu_e61EVt=A@mail.gmail.com>
Date: Fri, 10 Jul 2020 22:33:06 +0200
In-Reply-To: <CAKmqyKMoq7A_n-i8ho-RSLK_0zu-eipxcOj9xJfFu_e61EVt=A@mail.gmail.com>
 (Alistair Francis's message of "Fri, 10 Jul 2020 12:12:02 -0700")
Message-ID: <87mu47w1od.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_163313_304785_ABAE7199 
X-CRM114-Status: GOOD (  17.55  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Alistair Francis via Libc-alpha <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

* Alistair Francis:

> On Fri, Jul 10, 2020 at 8:55 AM Vineet Gupta via Libc-alpha
> <libc-alpha@sourceware.org> wrote:
>>
>> On 7/10/20 2:28 AM, Florian Weimer via Libc-alpha wrote:
>> > * Alistair Francis via Libc-alpha:
>> >
>> >> On Thu, Jul 9, 2020 at 2:36 PM Vineet Gupta via Libc-alpha
>> >> <libc-alpha@sourceware.org> wrote:
>> >>>
>> >>> On 7/9/20 2:13 PM, Vineet Gupta via Libc-alpha wrote:
>> >>>>> Rebased ARC port on master and fired a build-many-glibcs <glibcs> now (expect some
>> >>>>> abilist updates). Will do a full testsuite run
>> >>>>
>> >>>> No regressions in sysvipc tests !
>> >>>
>> >>> But quite a few regressions. Baseline is ARC port off of upstream 81b1c8cbb5b4
>> >>> "(hurd: Simplify usleep timeout computation)" and failures below seen in ARC port
>> >>> off of today's master ffd178c651b8 "(sysv: linux: Add 64-bit time_t variant for
>> >>> shmctl)"
>> >>>
>> >>> FAIL: dlfcn/tststatic
>> >>> FAIL: dlfcn/tststatic2
>> >>> FAIL: dlfcn/tststatic3
>> >>> FAIL: dlfcn/tststatic4
>> >>> FAIL: dlfcn/tststatic5
>> >>> FAIL: elf/tst-libc_dlvsym
>> >>> FAIL: elf/tst-libc_dlvsym-static
>> >>> FAIL: elf/tst-single_threaded-static-dlopen
>> >>> FAIL: elf/tst-tls9-static
>> >>
>> >> I see the same recent-ish regressions for RV32.
>> >
>> > Did you rebuild from scratch?  After the libc.so/ld.so ABI changes that
>> > went in recently, it could be the result of incomplete make
>> > dependencies.
>>
>> From scratch meaning glibc alone or the whole toolchain. I used buildroot and
>> glibc-dirclean to nuke entire glibc but gcc was not rebuilt. I can try that too.
>
> That's the same with me. The toolchain wasn't rebuilt but glibc was
> built from a clean directory. I am rebuilding now with a rebuilt
> toolchain.
>
>>
>> Some of the failed tests have prints about static TLS block ... so I'm wondering
>> if they could be related ?
>
> I see the same messages.
>
>>
>> | $ cat dlfcn/tststatic.out
>> | .../build/libc.so.6: cannot allocate memory in static TLS block
>
> That's what I see as well.

Sorry, my fault.  I posted a patch that should fix static dlopen:

  <https://sourceware.org/pipermail/libc-alpha/2020-July/116143.html>

Would you mind testing it?

Thanks,
Florian


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
