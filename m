Return-Path: <SRS0=/nRw=AM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21ECC433DF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 01:45:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B33802073E
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 01:45:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tZlxFsEs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vI1N1bQC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B33802073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AbPLawDlv8ZR0zkJNvkFrSYjIcI+pOyGmKiFyTa8y10=; b=tZlxFsEscvIzKriECzgy3oxC7
	f/gigmyDqcJOD5m+bBsU0qK47tDVVU0BwUlVog9efm/j1VJM0j4nWUO0KWyTUo0SFBqlQhiIyHTJA
	TRnhmeG5m85L7mqMzupjpWGAkHisUyvIdGWrsSx/AjhmpcCAw9uaJcQJc8aKBe61UaTZfXxeKake2
	zSL+GaQdV4f6NGWH+3Xzkviy+j5AUuGCvm4HhGTzUKW6Gpe1Erwbgd94SZ+EFAf04XS/Ao4AarJLq
	9PICpo60etCDlL0bfP+5JvwT9BIMdc+KgK/vQXG2OXu660FdvaC+fxh8kHlMwaddciM7nOvciyE8p
	LPuxJdduA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqRo5-0004FU-0Q; Wed, 01 Jul 2020 01:45:01 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqRo2-0004EG-Fu
 for linux-snps-arc@lists.infradead.org; Wed, 01 Jul 2020 01:44:59 +0000
Received: by mail-qt1-x843.google.com with SMTP id i3so17234221qtq.13
 for <linux-snps-arc@lists.infradead.org>; Tue, 30 Jun 2020 18:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6GnBHeqDegr09YlupGa/W0s6ULZFtCAj4kzXqmToCh8=;
 b=vI1N1bQCT2HcoUHtCjc0AN6zJ9zFn5kbewymwkcucaQj/iFCPUm8cnG93fv/LBs5tH
 kMw3y648jpnWlb18P8tERXntUxJ3mrclNx3/kvdB8st/ajnxWTinffw11tnRatvb6M3z
 D5jqNJaVyjkXXSwFcAouqkuZZJ7grp00FvOr2vGiYXPqw3JYiky9ifMqIlosRYDJ60Yf
 G9l8Q53esE6MGeQhBG3FI84lQkzBsgfQUP4GSMppSS1M0H4D2UIes4kU35kbs8yem601
 3PAQFSv1Y6O6nMPYZtN+HJ/BbOfrfOL5cYqIgv766nzOhk9+0XHz0A+1craEF6B2IJuv
 yang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6GnBHeqDegr09YlupGa/W0s6ULZFtCAj4kzXqmToCh8=;
 b=Yoqzh0/7J317iyo5pE1vE60FnMlmMy4JBBP6SPifngVKv5hS/Cd5Usey630GEv3tEe
 uxKpE6xwbRGOUHAGmfLKfthw4jhnvE/Rcg3+N+KUcAeoCH+US+20ITU/dkleuGWM1sZ1
 2kkGdMaqstzkq6SRfqt7czAIqWhv0QQ1zUAIL7/FSeAqE+q2m1muH2hUO7SGwsKjEwHc
 KHFk9FCga7qYi7n2ozBeo3shI2jVssUAUxsg2+/qM9fYyyKPgv8ZtwPJgAhyHsWhoBDj
 O/jx1Ov/D9FNnXJsHSRpPAJiHGEnPmi57oSdcixpq4/771JLnToN7yp0TKfSqrJmwBSE
 t9ZA==
X-Gm-Message-State: AOAM533onqsMEg2ZawzNxf5aCwvFuMp/vrURDuUfkQzUkhnrflN6vePm
 JXW4Z688j+RbAairJXd0yKWi0g==
X-Google-Smtp-Source: ABdhPJxWaKJF2RHsO4BGsKX+V2S/Jmp4JMISavdgS15VHClW6+rS2BTulS2Hkd9MKx3cRbqQs1mdSg==
X-Received: by 2002:ac8:4714:: with SMTP id f20mr23634670qtp.141.1593567894509; 
 Tue, 30 Jun 2020 18:44:54 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id a81sm5058000qkb.24.2020.06.30.18.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 18:44:54 -0700 (PDT)
Subject: Re: [PATCH v7 00/13] glibc port to ARC processors
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <20200615201441.31820-1-vgupta@synopsys.com>
 <c5edd9af-9dc6-d572-4779-6897e43c0a31@synopsys.com>
 <a3afd7ef-87d9-f033-fea3-f4854b9188ef@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <9c1ae166-4e37-e8ab-d6c6-cdbda5b15d83@linaro.org>
Date: Tue, 30 Jun 2020 22:44:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a3afd7ef-87d9-f033-fea3-f4854b9188ef@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_214458_853478_EF6CB2A7 
X-CRM114-Status: GOOD (  14.02  )
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
Cc: Carlos O'Donell <carlos@redhat.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 30/06/2020 21:11, Vineet Gupta wrote:
> On 6/23/20 9:56 AM, Vineet Gupta via Libc-alpha wrote:
>> On 6/15/20 1:14 PM, Vineet Gupta wrote:
>>> Hi,
>>>
>>> This patchset implements glibc port to ARC HS48x processor from Synopsys.
>>
>> ping !
> 
> ping ^2 !
> 
> I've posted the incremental series (v7.1) as a followup to include rebase fixes
> since v7. The changes are minimal and documented in respective patches. Kindly
> review so we can get this in, in this cycle.

Thanks for your patience, I will help wrap this up so we can include in
on 2.32.

>>>
>>> (b) Full testsuite ran in a cross compile setup using buildroot on HSDK development
>>>     platform. Bulk of failures come from cross testing setup and I
>>>     intend to improve things with native testing going forward.
>>>
>>> | Summary of test results:
>>> |     30 FAIL   (-3)
>>> |
>>> | FAIL: csu/test-as-const-tcb-offsets
>>> + FAIL: elf/tst-audit14
>>> + FAIL: elf/tst-audit15
>>> + FAIL: elf/tst-audit16

Any idea what it might the culprit here?

>>> | FAIL: elf/tst-ldconfig-ld_so_conf-update # not true: dlopen
>>> | FAIL: iconv/test-iconvconfig		# Needs gconv installed
>>> - FAIL: iconv/tst-gconv-init-failure
>>> | FAIL: io/ftwtest			# Requires execution by non-root
>>> - FAIL: io/tst-futimesat
>>> | FAIL: io/tst-lockf
>>> | FAIL: libio/tst-wfile-sync

Could it be related to NFS usage as well?

>>> | FAIL: locale/tst-C-locale
>>> | FAIL: locale/tst-duplocale
>>> | FAIL: locale/tst-locale-locpath
>>> | FAIL: locale/tst-locname
>>> | FAIL: localedata/sort-test

Any idea why locale is not being working here (these tests are really
simple, maybe another issue related to the filesystem)?

>>> | FAIL: nptl/test-cond-printers		# needs Python3 and target GDB on target
>>> | FAIL: nptl/test-condattr-printers	#    ditto
>>> | FAIL: nptl/test-mutex-printers	#    ditto
>>> | FAIL: nptl/test-mutexattr-printers	#    ditto
>>> | FAIL: nptl/test-rwlock-printers	#    ditto
>>> | FAIL: nptl/test-rwlockattr-printers	#    ditto
>>> | FAIL: nptl/tst-umask1			# passes if run natively on target (NFS ACLv3 support needed)
>>> | FAIL: nss/bug-erange
>>> | FAIL: nss/tst-nss-files-hosts-getent	# Timed out
>>> | FAIL: nss/tst-nss-files-hosts-multi	# Timed out
>>> | FAIL: posix/bug-ga2			# DNS issue: google DNS vs. SNPS
>>> | FAIL: posix/globtest			# require same user on target and host
>>> | FAIL: posix/tst-getaddrinfo5		# passes outside corporate network
>>> - FAIL: resolv/tst-resolv-basic
>>> - FAIL: resolv/tst-resolv-edns
>>> - FAIL: resolv/tst-resolv-rotate
>>> - FAIL: resolv/tst-resolv-search
>>> | FAIL: stdio-common/bug22		# Needs more RAM: 2 GB memory

We might try to enhance this test to avoid require too much memory.

>>> | FAIL: sunrpc/bug20790			# missing cpp on target
>>> | FAIL: timezone/tst-tzset		# passes outside corporate network

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
