Return-Path: <SRS0=2YWT=AV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCEBC433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 20:32:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1774C20748
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 20:32:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h39l93Rc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GIe6Sdjo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1774C20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ryafHzQ8QYtSd3P5KZ+zWTH8tIrqKSZB7xGinJCHAn0=; b=h39l93RcUGY+cXPvDndu6V6h9
	rOif75BY8ES84eu/yDz3ojDoUWLcVp7Ht3CimCbv+Jb/SxhEWNWiOnVSXq2NzZiudIssJi4YaC79U
	/C97Ii/4MOkVk4QWqLYkUMde5fLLK92loT3YKJmDw0s2mGZ9fydzk02sHsf41JQEWboDPVoBoeXge
	BD0fKdMTdw1uhilz8Y9Rg1h0SmtkYQPPNrekahbRtaNLX4WiTUR99JJcnQj1CTdnLvZEpAwF9UcgQ
	dAthRckqa0AyVCwA/9fBs0Ycal1l9PlXyiZekpAmkCvcG1diQf/SaNKh3yye2I+Y6VETBU+sl6YTP
	qvAUJWeZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtzhE-0002yq-DG; Fri, 10 Jul 2020 20:32:36 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtzhB-0002xx-Nf
 for linux-snps-arc@lists.infradead.org; Fri, 10 Jul 2020 20:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594413153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ob6OTJLy83V9qVNOaKZjKHgj0IoVKE5V+u8WETwsoSk=;
 b=GIe6SdjoWvIB755l66AUgMp3IQJm6LRBCb7CSoQmjGbkJRZH9avn3DC1q+/KGaRcnsY4qe
 Eo9XHKAjeW7aEibXubApj4rd81JovbbUUbqbeSxoXKA/nDnOJq+yyY63Xrbt3/Ky8Gc6kJ
 llhupdnYfsDeVslAVslYe4NgXdKiKkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-VTBYBq17M8WjWFacSTOMwQ-1; Fri, 10 Jul 2020 16:32:17 -0400
X-MC-Unique: VTBYBq17M8WjWFacSTOMwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FE2180183C;
 Fri, 10 Jul 2020 20:32:16 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-113-118.ams2.redhat.com
 [10.36.113.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF5867EF8F;
 Fri, 10 Jul 2020 20:32:15 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
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
 <87a707z4kr.fsf@oldenburg2.str.redhat.com>
 <ee2187d4-8383-8a8f-29ec-29c4b36007de@synopsys.com>
Date: Fri, 10 Jul 2020 22:32:14 +0200
In-Reply-To: <ee2187d4-8383-8a8f-29ec-29c4b36007de@synopsys.com> (Vineet
 Gupta's message of "Fri, 10 Jul 2020 20:07:23 +0000")
Message-ID: <87tuyfw1pt.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_163233_837039_C320DC62 
X-CRM114-Status: GOOD (  17.04  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

* Vineet Gupta:

> On 7/10/20 10:02 AM, Florian Weimer via Libc-alpha wrote:
>> * Vineet Gupta via Libc-alpha:
>> 
>>> From scratch meaning glibc alone or the whole toolchain. I used
>>> buildroot and glibc-dirclean to nuke entire glibc but gcc was not
>>> rebuilt. I can try that too.
>> 
>> No, rebuilding glibc from scratch should be fine.
>
> Right, I clean built the entire toolchain and that didn't help - but turned out to
> be sane thing anyways as installed headers seems were not rebuilt/installed and I
> needed the signum.h -> signum-arch.h fixup in vfork.S
>
>
>>> Some of the failed tests have prints about static TLS block ... so I'm
>>> wondering if they could be related ?
>>>
>>> | $ cat dlfcn/tststatic.out
>>> | .../build/libc.so.6: cannot allocate memory in static TLS block
>> 
>> This suggests to me that the static initialization code does not produce
>> sufficient alignment for the TCB, given the 32-byte alignment required
>> by the rseq area.
>> 
>> You could try and see what happens if you change
>> sysdeps/arc/nptl/pthreaddef.h to this:
>> 
>> /* Alignment requirement for TCB.  */
>> #define TCB_ALIGNMENT           32
>> 
>> If that helps, we have more of a generic issue here. 8-/
>
> Bingo, that fixes all the dlfcn/* failures (full testsuite still running)
>
> PASS: dlfcn/tststatic
> PASS: dlfcn/tststatic2
> PASS: dlfcn/tststatic3
> PASS: dlfcn/tststatic4
> PASS: dlfcn/tststatic5
>
> So is that the fix or more is needed ?

I have just posted an architecture-independent change here:

  <https://sourceware.org/pipermail/libc-alpha/2020-July/116143.html>

I had forgotten about the similar code for static dlopen when I made the
adjustment in elf/dl-tls.c.  I think we need to clean this up
eventually, it's fairly broken unfortunately.  But the patch I posted
should paper over this problem as far libc.so is concerned (like the
previous patch for dynamic TLS).

Would you mind reverting the TCB_ALIGNMENT change and test this patch?

Thanks,
Florian


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
