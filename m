Return-Path: <SRS0=2YWT=AV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052B6C433E1
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 09:29:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CACA320725
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 09:29:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EqD/cjTm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f6AaVHMD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CACA320725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jRtEm4DkwkpoBrLsUi8VKXYUfNY8um5fjUAzUwrnbIY=; b=EqD/cjTmhmGMqFC1TjgN/XL/F
	9bD1DpkpRO1WJfkYPDNIMs1lQZbLRjgAFr6RBwrW8jJfizk3D20mMGsW+8bYWir0jLYkWrlo3HWmQ
	mNl2G9E6dUyF6//8NWbbVCaLlAvWoX4blamPEccWfDFKJVyRik31rI/jTjv2LGZ7QYB47nFyAip0J
	HTY3mOj3IK+XCA43xYCKQ78d87HKm8VFa3wO7njChni/Q3tOWIl5b4qWBrgmU1wOetYsSjGj0IbYS
	19p0Rppj2mzN3HMjyAvL++hNkCLJ8dZOPk2QNtpG8St77pmKGqlZoHDOIUaE3JODyy/voosYCfNn4
	qwzapLUiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtpLE-00025C-TM; Fri, 10 Jul 2020 09:29:12 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtpLC-000245-G0
 for linux-snps-arc@lists.infradead.org; Fri, 10 Jul 2020 09:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594373349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=28wdBkLSro1dSR8WxXNX8ILziydhQ/VL4v0ZhMAJMp0=;
 b=f6AaVHMD88N3wQ1uQszHxf8sPU7N0jGPDzgX0ZX0vPIZ0zt8VT901cKNBMMab5xvr/0gsy
 WCKBKtlpyIuUdkqHkezcKXmF7fU/hPhG6r47Uo27zzvtZgbTJsXL85hs2F5Mg/SkWDbJ7P
 hJ7J+yxOSTqfLUK3h3p7dLgprm8p+I8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-PFbSRcfFOD-FRkjLpWrvEA-1; Fri, 10 Jul 2020 05:28:31 -0400
X-MC-Unique: PFbSRcfFOD-FRkjLpWrvEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94498800401;
 Fri, 10 Jul 2020 09:28:30 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-113-118.ams2.redhat.com
 [10.36.113.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 728FB5C1D3;
 Fri, 10 Jul 2020 09:28:28 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Alistair Francis via Libc-alpha <libc-alpha@sourceware.org>
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
Date: Fri, 10 Jul 2020 11:28:27 +0200
In-Reply-To: <CAKmqyKM4pgF=E6bzCdFqYkboGQWURjcVmAz-V5KVqTZts8otug@mail.gmail.com>
 (Alistair Francis via Libc-alpha's message of "Thu, 9 Jul 2020
 15:01:02 -0700")
Message-ID: <87o8on4t38.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_052910_585650_25CF4BE1 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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
Cc: Alistair Francis <alistair23@gmail.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

* Alistair Francis via Libc-alpha:

> On Thu, Jul 9, 2020 at 2:36 PM Vineet Gupta via Libc-alpha
> <libc-alpha@sourceware.org> wrote:
>>
>> On 7/9/20 2:13 PM, Vineet Gupta via Libc-alpha wrote:
>> >> Rebased ARC port on master and fired a build-many-glibcs <glibcs> now (expect some
>> >> abilist updates). Will do a full testsuite run
>> >
>> > No regressions in sysvipc tests !
>>
>> But quite a few regressions. Baseline is ARC port off of upstream 81b1c8cbb5b4
>> "(hurd: Simplify usleep timeout computation)" and failures below seen in ARC port
>> off of today's master ffd178c651b8 "(sysv: linux: Add 64-bit time_t variant for
>> shmctl)"
>>
>> FAIL: dlfcn/tststatic
>> FAIL: dlfcn/tststatic2
>> FAIL: dlfcn/tststatic3
>> FAIL: dlfcn/tststatic4
>> FAIL: dlfcn/tststatic5
>> FAIL: elf/tst-libc_dlvsym
>> FAIL: elf/tst-libc_dlvsym-static
>> FAIL: elf/tst-single_threaded-static-dlopen
>> FAIL: elf/tst-tls9-static
>
> I see the same recent-ish regressions for RV32.

Did you rebuild from scratch?  After the libc.so/ld.so ABI changes that
went in recently, it could be the result of incomplete make
dependencies.

Thanks,
Florian


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
