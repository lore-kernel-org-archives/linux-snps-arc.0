Return-Path: <SRS0=rUT0=3F=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A70C33CB1
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jan 2020 11:44:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7D8B20730
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jan 2020 11:44:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KZ1EX+Fz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7D8B20730
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tmpxsPEgm7YKHniEaZlPaojERs88N6/RTl4xG8r1CI=; b=KZ1EX+FzorMy5p
	7XqQ1F4/0JIzd+lbQCYmy4Bn/7az+xiUPyCOCH3GYZdrPISYEj4W3f5GuDEr/wJg1LuHWXIekneIt
	9gRR6hDWWBlGObmKZ1YNH2iuSYtut+n4/vSqr77gMvoVIWs68ir7Zuxsmcy+NttOS6MiwcWJ5v6Lg
	j15IVr5sZTNMPVInD/0J1Cq+gtzIzwz2WJ+lHgOY1L6B0LHJiXb5pC00lrFVVa60y1Tm27pYTlUeJ
	DhvPmc7mrqn7411KMLodk7tujPCsIGFMfhARyj11XKMmP85O38Yfa4BUFc0HmkRKuVBzHTj0QqLnd
	rUPba2L3MmGxTvRtbsFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is3ZJ-0004G6-Ri; Thu, 16 Jan 2020 11:44:09 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is3ZD-0004Et-AQ
 for linux-snps-arc@lists.infradead.org; Thu, 16 Jan 2020 11:44:08 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MvKTJ-1jjCLk2HEf-00rFVD for <linux-snps-arc@lists.infradead.org>; Thu, 16
 Jan 2020 12:43:57 +0100
Received: by mail-qk1-f176.google.com with SMTP id x129so18748264qke.8
 for <linux-snps-arc@lists.infradead.org>; Thu, 16 Jan 2020 03:43:57 -0800 (PST)
X-Gm-Message-State: APjAAAW8Y5iidivNFpcliz1b1Zy1ZM6YM8toFp+sXezwFibuBdm3OQZ2
 5E8eE1oBYu78x+pg8CCMvBOjq4xOzYa/u5R8ZxE=
X-Google-Smtp-Source: APXvYqym5eFiRPKVnv/qyi9spTjJFVaRol3iabOK0ekCyztzIvYdqXhBVKbxN+eRg7ZjVuhAgzjyuhoaOaMqN4MM72c=
X-Received: by 2002:a05:620a:cef:: with SMTP id
 c15mr33307465qkj.352.1579175036455; 
 Thu, 16 Jan 2020 03:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20200114200846.29434-1-vgupta@synopsys.com>
 <20200114200846.29434-2-vgupta@synopsys.com>
 <CAK8P3a3W0eLK+qypnPwq=PdcF7+ey8OZEhmOoA6Bg7hMGm5hqQ@mail.gmail.com>
 <6eb7587b-c3bc-691d-9d27-d4e687114a42@synopsys.com>
In-Reply-To: <6eb7587b-c3bc-691d-9d27-d4e687114a42@synopsys.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 16 Jan 2020 12:43:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a398-ojtETr9A7YsGTHBnmqyiykcC0YmHQSL5Cw1jy=Ew@mail.gmail.com>
Message-ID: <CAK8P3a398-ojtETr9A7YsGTHBnmqyiykcC0YmHQSL5Cw1jy=Ew@mail.gmail.com>
Subject: Re: [RFC 1/4] asm-generic/uaccess: don't define inline functions if
 noinline lib/* in use
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-Provags-ID: V03:K1:mE+wDEnlJge+BNWIjDN59LfNkV0xzNU1UETikXJf8Lrwpk6n8lf
 CJQa1eHbDS9RJ6GeYMdHoVGLIgjZd5GYLc8nl7Ih+amyg7lkG2CsfZTP8hJMsBARSXxWzcG
 iJrSMF9WGiFY7E8Iep9ji0spnvZ/zEqsk0gAS2t9W3Us08z59SfUTUl/+YKeMCCNlpipLVX
 UsFLN509r+8D2TZcxPlCg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EZ3s9etzfQU=:22xzQoqgfv86cKylZRO9k8
 rZMCIs7EJ+s+j3pbzLtBhOqJ+3xb46ZZ08I/QJHUepzJZDd44fQNRl1MwEOwUrTaVwtJHfm3D
 6ibNSMVYTuzhO5yRFHYe61NsfgAsbIu4U/aWROOAM7gWGZRXhCIzIbl2SRZSYNg0HpkKMoWEB
 Bla2xKk2E8GGLK6BeZIgvaILQ/OiuzpNOGIUfGlJAw1hqv4bdQ9pqFhRZccpMI62+nBC0mS3s
 hzJx24Fx1SRN8tRgBqJNXKFksgaTbUIgDuQn3q9beppJCbbXvCDQwLHxqBSus2QigJQbtKz41
 3rLAIDx48F8qR3fblL0Bxy6H9aPn5pDhFsIJYQYvFHlmXbGXuuLkDF4iN2WUylfSNzamlmLhO
 CUOFd96LuJanG5r5VoiquMOIe2vEvg5U4kTrmagbCrYMCLvi3afPgupJzRAqqURH4bqTm5cgP
 emjn8Nti2U58ljjy7g87m5gdwA0vBUItQ6mcEtjtWQV50xBZrtem/8LrZIziIAb+j4zlemCLI
 e+uNxblngvuyLLp3ZWe/54B+N0aj1WCdZYlgdBN6vGqsZSH0vRIri72IkOuoAD6+STVQmtTCx
 sou/keoJMPpcNQgVsRcompMPk2urbUGpefvFVWdAzzG7Zgs6pC2ehm3ispbRrryVFfGKI1jAX
 QTfgi3XUzW52zTsHEMNqCwBK4vTAziqoY8At+rguW0QmnfqhE5Cd1aY1u253bKc8aRvUv2zHP
 fMHWIb3hEj5ELJaCWZpLg3cStDbcR0kHVNlFvRpHVTd04Os/dkNrGOIm/Zzc5V0640vcG7K4t
 33VqjXMFGLb+4zFyokIAWPQrthFpyPy1/GS2xmgyUNISauyoTKO2hpztdqag6XJga8P4sJlTo
 lC+ri47HxXhD7BR0NuXQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_034403_657002_EA2654B6 
X-CRM114-Status: GOOD (  16.94  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrey Konovalov <andreyknvl@google.com>, Aleksa Sarai <cyphar@cyphar.com>,
 Ingo Molnar <mingo@kernel.org>, Khalid Aziz <khalid.aziz@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Jan 16, 2020 at 12:02 AM Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
> On 1/14/20 12:57 PM, Arnd Bergmann wrote:
> > On Tue, Jan 14, 2020 at 9:08 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> >> There are 2 generic varaints of strncpy_from_user() / strnlen_user()
> >>  (1). inline version in asm-generic/uaccess.h
> >>  (2). optimized word-at-a-time version in lib/*
> >>
> >> This patch disables #1 if #2 selected. This allows arches to continue
> >> reusing asm-generic/uaccess.h for rest of code
> >>
> >> This came up when switching ARC to generic word-at-a-time interface
> >>
> >> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> > This looks like a useful change, but I think we can do even better: It
> > seems that
> > there are no  callers of __strnlen_user or __strncpy_from_user  in the
> > kernel today, so these should not be defined either when the Kconfig symbols
> > are set. Also, I would suggest moving the 'extern' declaration for the two
> > functions into the #else branch of the conditional so it does not need to be
> > duplicated.
>
> Given where things seem to be heading, do u still want an updated patch for this
> or do u plan to ditch the inline version in short term anyways.

I'm trying to come up with a cleanup series now that I'll send you.
You can base on top of that if you like.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
