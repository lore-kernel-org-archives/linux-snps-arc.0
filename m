Return-Path: <SRS0=2YWT=AV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA79BC433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 17:02:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A417C206F4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 17:02:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B1grPosG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fAd8iJXk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A417C206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WA0LLGvVA+Yvc8uRmHCCAWCfINmvwjne+62RVNYikVs=; b=B1grPosGW6OS7aVYeRBf8LjoZ
	mk/qGzivK8/7pyzjDcZFZbNIsK7vbEv0VMXqo9rKaePGjtq/lD+Ux3OX9H2/9+GkV0vdAr8LX8BGl
	mAZQJqlYZP0JwUgdlDMSZz1jfeMOGBJGC7xCr4hhZCaYozC/A5ah+Ddmt7EYQumU3ywwp6JvGtL9x
	gdU1BuefTtFB5myhsnBPCC30NCuipRxU03HYUA/SURCM08wz2F4wOGndKdIK7ptUwnKDT48KbUO+Q
	d5+5Edt/0iWmy+8mqPTEwm6sszVTw6ULvocz3lazXMihP8aK7F5SdPpGJEG92YjqDZNNtqVQf4QDN
	AUaDdzoPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtwPn-0001sK-JP; Fri, 10 Jul 2020 17:02:23 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtwPl-0001rH-T3
 for linux-snps-arc@lists.infradead.org; Fri, 10 Jul 2020 17:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594400541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ECwrATk4Tl8wbLLhhCxs7D8Z4/hgDNbFx67Knr/jgeM=;
 b=fAd8iJXkxLcG1vExBxzrPbCOH1nU80RzBDlq3eA4XlAcffgL1qlX2zxYnHYkFoiaTqGg/H
 XQN60Ira+AHQeR/EVdknU150H/QaA81W1EBvAK1lrCYu1DObmZREiHx9U4IlalDHysTdEF
 J0fc31GHlzAMY6aGG3W5UkvyCw1dj7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-mI4AZ128P1m1xR_jMhD1Og-1; Fri, 10 Jul 2020 13:02:18 -0400
X-MC-Unique: mI4AZ128P1m1xR_jMhD1Og-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 474661082;
 Fri, 10 Jul 2020 17:02:16 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-113-118.ams2.redhat.com
 [10.36.113.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B82A7EF92;
 Fri, 10 Jul 2020 17:02:14 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
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
Date: Fri, 10 Jul 2020 19:02:12 +0200
In-Reply-To: <cf8e41c7-8a58-f9bc-ab6a-ca5099bf6b46@synopsys.com> (Vineet Gupta
 via Libc-alpha's message of "Fri, 10 Jul 2020 15:53:25 +0000")
Message-ID: <87a707z4kr.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_130221_989928_D33FE9A6 
X-CRM114-Status: GOOD (  12.43  )
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
 arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

* Vineet Gupta via Libc-alpha:

> From scratch meaning glibc alone or the whole toolchain. I used
> buildroot and glibc-dirclean to nuke entire glibc but gcc was not
> rebuilt. I can try that too.

No, rebuilding glibc from scratch should be fine.

> Some of the failed tests have prints about static TLS block ... so I'm
> wondering if they could be related ?
>
> | $ cat dlfcn/tststatic.out
> | .../build/libc.so.6: cannot allocate memory in static TLS block

This suggests to me that the static initialization code does not produce
sufficient alignment for the TCB, given the 32-byte alignment required
by the rseq area.

You could try and see what happens if you change
sysdeps/arc/nptl/pthreaddef.h to this:

/* Alignment requirement for TCB.  */
#define TCB_ALIGNMENT           32

If that helps, we have more of a generic issue here. 8-/

The problem is that the TLS memory allocator does not add alignment
padding on its own.  This could meet additional alignment requirements
if there is just one thread yet when higher-aligned TLS is loaded.

> Also while we figure this out, does this prevent ARC port from being
> committed.

I don't think so.  We just have to make sure that it does not block the
release, i.e. resolve this during the next week or two.  Do you think
that would that be possible?

Thanks,
Florian


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
