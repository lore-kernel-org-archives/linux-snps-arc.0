Return-Path: <SRS0=v1Oz=3D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD70C33C9E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 20:58:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D38D224658
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 20:58:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qCG3gC6n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D38D224658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LU7LtBChBe6jcCcCGhp50qLtPFpPKCLLiMC0WNQH5NQ=; b=qCG3gC6nMYrW09
	Q6quVulWQQN/bB7xSk0h65ggSD6rGFdMhRkc2/SDpKfMJl3LLNkErsK7Qg070FXMxUJf2phcJdJ41
	lm3nwi1y7uQrkwSpLsjYqG2X2Cdse1W+uUKmieFtNj87arjrOq5uSQmGBfifNQCEhRXwfOI2sODxo
	uBcxaBzRupXrzdtWvMM3LjbMmJpwd8pPZ4Q7EblZidKC48c2w++VBlQQgGmRiLg0pVvShLiJYQwSI
	ex6rHSsWAp29QuvfZbjJwLMN5aY448WvjWjJwk1+2efTm0xLoC6+7o9LFmuXbyeTDXCuz7w0BvXhj
	fFSCjg7iF7Hzz6TvWEQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irTGH-0003Cf-HO; Tue, 14 Jan 2020 20:58:05 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irTGE-0003Bw-3Z
 for linux-snps-arc@lists.infradead.org; Tue, 14 Jan 2020 20:58:04 +0000
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M1HmE-1ioi6f0ZQo-002kif for <linux-snps-arc@lists.infradead.org>; Tue, 14
 Jan 2020 21:57:59 +0100
Received: by mail-qk1-f169.google.com with SMTP id c16so13556356qko.6
 for <linux-snps-arc@lists.infradead.org>; Tue, 14 Jan 2020 12:57:58 -0800 (PST)
X-Gm-Message-State: APjAAAUQz5PBTeKfmT+QOTaiKutMrx5Yjwf6b43oXmAqeKT3crOF/kSV
 aInzUylLGZpyTpLyTjxKjIuTtv+3NWQrg0vhkh4=
X-Google-Smtp-Source: APXvYqwhg5lxdDG9hw24GdeXieaQIzqGf7tcgGAhb/t/luGZu0DMMqM2FGkeCDHJm3CEiDORiqOll/dN1rxk4xKyAcY=
X-Received: by 2002:a37:a8d4:: with SMTP id
 r203mr19031507qke.394.1579035478013; 
 Tue, 14 Jan 2020 12:57:58 -0800 (PST)
MIME-Version: 1.0
References: <20200114200846.29434-1-vgupta@synopsys.com>
 <20200114200846.29434-2-vgupta@synopsys.com>
In-Reply-To: <20200114200846.29434-2-vgupta@synopsys.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Jan 2020 21:57:42 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3W0eLK+qypnPwq=PdcF7+ey8OZEhmOoA6Bg7hMGm5hqQ@mail.gmail.com>
Message-ID: <CAK8P3a3W0eLK+qypnPwq=PdcF7+ey8OZEhmOoA6Bg7hMGm5hqQ@mail.gmail.com>
Subject: Re: [RFC 1/4] asm-generic/uaccess: don't define inline functions if
 noinline lib/* in use
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-Provags-ID: V03:K1:lDJvH/qMRCZPJDiaDS7Xll4YAbfMHJSoWZQKzXv71PKz/Q73H8c
 rCFPHXf7iJutr5w1GlPH477MG5ltXTZQ0p6ATjJ92Kh+PaWnNdg0cCuCWUXocatfSWUyGvX
 Zc4gHASQpvrDQKMb+v7qHyRgXmEoRX8T/aTJC5VIJvtXuqmVac8b/mJkr38uzojiaT6wSK3
 KOEdikIfpbGPG7QdYE4Bw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L1qINZ9byuI=:8XDRAmAMZ/2FJ2BaRICdbX
 6cn2QkyNim6mGYIthTlCPldMFZhUk8nH8Lg7N3wK7L/igDJJ6paE9aQs/WZq8pMSxMvbpolQW
 7xHrbsam4zdciWJ8EzybT8pEKf9TSyNfU2CqE7sUIyzjVZIDDLWZLzP3giKc17eRelnd/KDi4
 g+sLz28SXguM4kISr/yVGSxOeeNalSWDTzxfu6xacnLBypaDCfC0W12X6hL+Hy4zyEHWNAsAf
 bMrp6xuxkkqea2WQBuWyOUpCOccx4rt9PZpxGJ3OumgkYW4fUoP9wKdPJvuDU4jtGI8EOe4of
 cc6scZgv31vNrmybxmk99rvQEwAHCxVJNbvS9C0upcFZfnij7TIbNTwQ3kmg3/3Svhmt9lwb6
 smt4t4tfkyt0Zy7HZRFOv1OfemZsxXdMBnTT0R5O/uW+VZopOOoFg/UqoeBzYVcVZCky22DoM
 URwgC3O0ncJeMA/u8+P0ENq79ziAqzK/lEFqqbALh31VmRhXj2Ut7wekXdJ3XocDmdgeTw/O6
 DTaACrTMjNpL/Z47tdLu/dfyE8NtzkzSskzS0fgcMhG1DcFDkO9Xa2dFpikTpNMnwInwLm0Wd
 FPQFiG0skTd3lXgY9FuZPQRiNMZ+nv6mZzZHalwrH/ip0Xb+/dL2+UuY6boypq9eFumbMNnUl
 8F3IDxrs9Am+eN0yttrAKM4t2s1hUofwkPZ4OTWUi3rzVHWUIdNJZXwtHhDht0ozLqaHuqzUS
 GgeFK2UoEpZxuRv6A2g/4P1yRuuV9C4LbhlAFbiBtKa0Strxi10JRt90itkrATJBd7OB/Wvem
 CIjLRLelk6/fyX0XmYvYnPdhjuHdkW4Ar+ToduGVi4WJ0g4IySK8aCclAj0j+T/EyUYca+x9e
 pvTns9yf+ziPx3mToAug==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_125802_441168_F695EF2D 
X-CRM114-Status: GOOD (  11.87  )
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

On Tue, Jan 14, 2020 at 9:08 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
> There are 2 generic varaints of strncpy_from_user() / strnlen_user()
>  (1). inline version in asm-generic/uaccess.h
>  (2). optimized word-at-a-time version in lib/*
>
> This patch disables #1 if #2 selected. This allows arches to continue
> reusing asm-generic/uaccess.h for rest of code
>
> This came up when switching ARC to generic word-at-a-time interface
>
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

This looks like a useful change, but I think we can do even better: It
seems that
there are no  callers of __strnlen_user or __strncpy_from_user  in the
kernel today, so these should not be defined either when the Kconfig symbols
are set. Also, I would suggest moving the 'extern' declaration for the two
functions into the #else branch of the conditional so it does not need to be
duplicated.

      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
