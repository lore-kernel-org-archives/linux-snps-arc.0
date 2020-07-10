Return-Path: <SRS0=2YWT=AV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B862C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 21:06:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C39E420748
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 21:06:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kYH9A4Ia";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="earKH3nB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C39E420748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oeVd8DZqJAFcTQofF/IrM166c0JXgDb5+eo4yKjvWhU=; b=kYH9A4Iav4NuP0xCvFdKBQx4F
	ZaOTp6gg0Mq7fkyUoaK87R7Sh+NOzghSCCBE8IDR8ahY3lAO9VD4MJH6N3kiTy0ZkGgFBLVNEiY0k
	k5hG+7vRW1faF86JWW3sRYUt4mMjKgfp9lgmv7CKDtdAz3sUUzwdLx0v9ZucnTr3WpG36mTScRAC+
	q8VmdVCvlyB3x4g+lmNyH+I/MTJJgSt+06KCESnlszrANRFsowAl33wiulvkYeyETc9dUcEJEawjk
	WAvNsmN6yqLOkcamhaRdjIKH3/RO4OlIDey0BPCh9Tw3eV+CjNejScy7uHdfmSdhx3q/AD9+UM3J9
	4U3eDe0Lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju0E8-0004zu-8B; Fri, 10 Jul 2020 21:06:36 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju0E6-0004zQ-G8
 for linux-snps-arc@lists.infradead.org; Fri, 10 Jul 2020 21:06:35 +0000
Received: by mail-io1-xd41.google.com with SMTP id c16so7439353ioi.9
 for <linux-snps-arc@lists.infradead.org>; Fri, 10 Jul 2020 14:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fOxAPCG7HixRWmgLU8HHZ+Gs8LneAQngMAPueAugdtY=;
 b=earKH3nBBtpHATcH+rGoqVxKcq6d5J7P9HvZuhsmubxVwSXYcBwKxF8sZAZrvCkd29
 b9rsR1phyn+j+nJKyOlQY698owEFgvQBgmWHfOZ1+7Sha5T1sgQQ2m44QZndlPCy98Jf
 39L4e4Wqr1XGn5kLrHr5Eh7NRbFUDkdY+p0jVvAlZwuFb81IdM/fSYeMlddWp1ZN7vbi
 LIDnlN4jY1ZxlXxGS8VkWpx6gHdf543h9R5gMAgRu1zGwDpqdyU/iTSayRzTHkXPUOhl
 kU9p0FiroKz52eCqALPWySf8cPqHF1Qf0L/Ez+di8F3aGSuPSnUuWsdu74wpKW4dgjkh
 U1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fOxAPCG7HixRWmgLU8HHZ+Gs8LneAQngMAPueAugdtY=;
 b=VFwYWVeNbjYjgdvS+R0NEzYa7dtgKYQU9X9RIgDemmgVdaoaFNXnzspia1eU2RpmSS
 WVu4c3wTh2yXSsg9XC8oLjPLFib93MCUNPHkY9rYaP5RsH9s/xGmX6Zja8ta3PIOfukG
 LdeSu7PRKno/MCXxR1+w8fc/6jskLNX9NTwAPSBknwYldhnmMWt9gnNtBYFpImhFEP2x
 22CNZERQ+HrPVvvE9ajtsNVFs2fahoHd5zU8csduOBfSPUUSHaaSgXGIY8Ks/cIxKNc9
 Tb4wb7YrFSlF6AiJbje54nQZdmWMCF+nD2k2Zud9QvMjl72PQjbvt0BuI81FfS7VdBJp
 g3iQ==
X-Gm-Message-State: AOAM531szwSXJOWIANZlv7n3tVHbZeEAayYXDJ0CAPq8yQm5BZ5J7NWg
 /ylhYpyX/G3b+m62wyVoD/EYkNE9/KOW/lsTiHM=
X-Google-Smtp-Source: ABdhPJydvy1JLr/UTZKqR/dLEE40Zjd/184DVHjfp/IszoZAGko2qkgnLoTsco8SrvXQ8E8ADMyVO7RtlRNAW/JgTnk=
X-Received: by 2002:a02:6c4c:: with SMTP id w73mr81328674jab.26.1594415192647; 
 Fri, 10 Jul 2020 14:06:32 -0700 (PDT)
MIME-Version: 1.0
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
 <87mu47w1od.fsf@oldenburg2.str.redhat.com>
In-Reply-To: <87mu47w1od.fsf@oldenburg2.str.redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Jul 2020 13:56:39 -0700
Message-ID: <CAKmqyKM9sM3OwYGJ=XRNuBhWBVOJaEMD9W+fvzCM5xwUTYg2-w@mail.gmail.com>
Subject: Re: ARC testsuite regressions (was Re: [PATCH v7.2 07/13] ARC: Linux
 Syscall Interface)
To: Florian Weimer <fweimer@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_170634_569592_CE92EC38 
X-CRM114-Status: GOOD (  19.94  )
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

On Fri, Jul 10, 2020 at 1:33 PM Florian Weimer <fweimer@redhat.com> wrote:
>
> * Alistair Francis:
>
> > On Fri, Jul 10, 2020 at 8:55 AM Vineet Gupta via Libc-alpha
> > <libc-alpha@sourceware.org> wrote:
> >>
> >> On 7/10/20 2:28 AM, Florian Weimer via Libc-alpha wrote:
> >> > * Alistair Francis via Libc-alpha:
> >> >
> >> >> On Thu, Jul 9, 2020 at 2:36 PM Vineet Gupta via Libc-alpha
> >> >> <libc-alpha@sourceware.org> wrote:
> >> >>>
> >> >>> On 7/9/20 2:13 PM, Vineet Gupta via Libc-alpha wrote:
> >> >>>>> Rebased ARC port on master and fired a build-many-glibcs <glibcs> now (expect some
> >> >>>>> abilist updates). Will do a full testsuite run
> >> >>>>
> >> >>>> No regressions in sysvipc tests !
> >> >>>
> >> >>> But quite a few regressions. Baseline is ARC port off of upstream 81b1c8cbb5b4
> >> >>> "(hurd: Simplify usleep timeout computation)" and failures below seen in ARC port
> >> >>> off of today's master ffd178c651b8 "(sysv: linux: Add 64-bit time_t variant for
> >> >>> shmctl)"
> >> >>>
> >> >>> FAIL: dlfcn/tststatic
> >> >>> FAIL: dlfcn/tststatic2
> >> >>> FAIL: dlfcn/tststatic3
> >> >>> FAIL: dlfcn/tststatic4
> >> >>> FAIL: dlfcn/tststatic5
> >> >>> FAIL: elf/tst-libc_dlvsym
> >> >>> FAIL: elf/tst-libc_dlvsym-static
> >> >>> FAIL: elf/tst-single_threaded-static-dlopen
> >> >>> FAIL: elf/tst-tls9-static
> >> >>
> >> >> I see the same recent-ish regressions for RV32.
> >> >
> >> > Did you rebuild from scratch?  After the libc.so/ld.so ABI changes that
> >> > went in recently, it could be the result of incomplete make
> >> > dependencies.
> >>
> >> From scratch meaning glibc alone or the whole toolchain. I used buildroot and
> >> glibc-dirclean to nuke entire glibc but gcc was not rebuilt. I can try that too.
> >
> > That's the same with me. The toolchain wasn't rebuilt but glibc was
> > built from a clean directory. I am rebuilding now with a rebuilt
> > toolchain.
> >
> >>
> >> Some of the failed tests have prints about static TLS block ... so I'm wondering
> >> if they could be related ?
> >
> > I see the same messages.
> >
> >>
> >> | $ cat dlfcn/tststatic.out
> >> | .../build/libc.so.6: cannot allocate memory in static TLS block
> >
> > That's what I see as well.
>
> Sorry, my fault.  I posted a patch that should fix static dlopen:
>
>   <https://sourceware.org/pipermail/libc-alpha/2020-July/116143.html>
>
> Would you mind testing it?

Yep, I'm currently in the middle of a different test. When that
finishes I'll test again, that'll take around 48 hours though

Alistair

>
> Thanks,
> Florian
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
