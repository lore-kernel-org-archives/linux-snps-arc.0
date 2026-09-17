Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC15C982D0
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Sep 2026 09:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxLj98TgJuA8VWmqDVRmhpib/rJ9Db8zn2mkJlzi7+Q=; b=35QokmbVtRPkyx
	RI3YehXbVPUZr3xsNVQeR1D9wWy9ug2IWec5VfE/dhzUSfzS7NRlkF4VSDYefb2QyfoA2nbmzVTUq
	VWwS2PJ4R3GFYFFTNMcYvG8Wx5RaNj4ay8oC/8N6T3dW/zL+onBLE9JVsbOzyIw5imOOvcbjWJenA
	XxzOvVvn+plMplEAZBWiYjtwujDczeFMfKkZdWMXQ/ckaG79HRqpEmSLl6/N2A7xjjgjMhwWRfyOE
	19QOFReSwubPYrTPy0+JFnwNzELV5BskBLDvxr/HTZhCxgrc+6IJQ7uPDrbFwpa+TIisAaB1AO+6q
	UHLen+sPAv6YGbJtQcBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x782s-0000000Ax11-1sKK;
	Thu, 17 Sep 2026 09:04:42 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x782q-0000000Ax0X-2tVO
	for linux-snps-arc@lists.infradead.org;
	Thu, 17 Sep 2026 09:04:41 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so3186105e9.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 17 Sep 2026 02:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789635878; x=1790240678; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2k9dKahryNmpFDhF3eaPjWDHVr7V9Y/xYKcgApds+0s=;
        b=ek94Uu6h97O9L0yYgM/nYLfbDgK4lFpPNcboBVgWhhAj5Ro7rGSJtARmv8B15pwBJe
         Mq5xdbPWDEwbhCGYMeK5eOGXHX2hZ5q/8PumeR28lFhCMHXeLPVlQTH7r1TP/o6YRkQA
         +Pn62SyOwPzW0oEWyygf6LPHL5Y5MYvOsdnvfdCYMdDjqX2G6sG7GWDPP+T6DGJly+0k
         3wTyxWGRYRG+V5E/Q75QBnrMe1x0xmweOCsDsAn+arY3EY6kMxEaRmx1LRKA7rpkCY1R
         Gk1YvwvaOP5OmK/xplGSZ/yAj/hWtBV1GuYdQIBHW57DhHSGwDSiUcA6lHSDsFj44Z7C
         z3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789635878; x=1790240678;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2k9dKahryNmpFDhF3eaPjWDHVr7V9Y/xYKcgApds+0s=;
        b=oRQZc0A52WqgS25kuibIn7jcmp7dBJzCHdu2LrBQN9qTrd4xtwxyjCPlO6dGtgKVxm
         fc8Hwi9AopoyeJitY5hsE8Nt0a5AUmoslgwiXOJUui5QafQl1U1f7zoQQfoYe5yh8eht
         M6I83a8zynjsPNy66vXDwk7KEXsay7ZwsN5BZiwSkAfhP40kgubgV8nQCEjmcHdMaHDz
         RVggLvw2M/+C5WEX+DbdLPhpCZSdP3VTdhkXtA8/ZgVQBCQVnXb+S8K9nPwLAb5lbi35
         qYedHnFAZKiejnt9EGcmUbat8AS57leZUrCpX8ylFLgKeqH1nCsatJE8/I95qa31GfT3
         xD2A==
X-Forwarded-Encrypted: i=1; AKwUvBy5Wg9QItUGSNfZFCyov1l1ncpjsV0rnqYvrnXhuwYyfVQfCg9kje1zR5MCw/GphdZqAvmm4k82+e1dI5BK+g==@lists.infradead.org
X-Gm-Message-State: AFuF++kRNXe0Rizh08Ru7VVckWggyjNs1uWYRHpx3L69SS/+UF7TuRCE
	FmGHWajcZBkZYNehgzqUsbcpKvmGiy/SRZ9e5nUFgAryQE2zGqy7zqnf
X-Gm-Gg: AYBFou1QAJqShiJeqJfe9xRw3q62TQCUcHWtlHZkAecJHQP0KgU+hrR4KMUKSnM/t9O
	ZpeVLOoBqdTrbhyZek2Sg+9H2Rw0cb7TVRqO7mRTC6Ytg6QTHlklLiucQQmPJi8Mo8RmJuRTnfn
	bQK1p4bBm/DiPIskIA4z2p4JBzwKa/3JBbBLGxpKkN7e6kj6O/noToPCyzK5KcTW51bJOv3aUW+
	3DnmGA0/0WryM/4TdbO2c5IUgq3gdD2pnCrIcIruFjM/9wmc8yIC3zNzPegAtR3AMN4SESIlTPi
	QoPxgKS/O00qjcgAFkhtgr9MXm5Lt5tItJnDtEei3zD4C6eoIimCNGttIvgFPJMCJIDF5b+1zYi
	NhoSYmQ/0agnaI4ROVWGY4r8Zo69KvHUxMJfiM8ffjbkI8ViKiXWJ2hrWMrxHfR/fAWT/HdsfwY
	9+wDALU0SQ6B6fPDAZiycguJFa+CSubTWa+490szm6H+aQu4HlANjxY+o6rkr8Dm4xtT01eeY8B
	UE1fb7j2vg30uEjOfiO1PWzvPVQofK8+4Va
X-Received: by 2002:a05:600c:1d29:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49eb72fc10fmr71803655e9.15.1789635878139;
        Thu, 17 Sep 2026 02:04:38 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbbcf5277sm74911055e9.3.2026.09.17.02.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:04:37 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:04:35 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vineet Gupta
 <vgupta@kernel.org>, Guo Ren <guoren@kernel.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Chris Zankel
 <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, "Paul E . McKenney" <paulmck@kernel.org>, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] csky: Emulate two-byte cmpxchg
Message-ID: <20260917100435.664cf00d@pumpkin>
In-Reply-To: <20260916200215.21774-4-brads@mainlining.org>
References: <20260916200215.21774-1-brads@mainlining.org>
	<20260916200215.21774-4-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_020440_750148_36C6B161 
X-CRM114-Status: GOOD (  18.87  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, 16 Sep 2026 20:02:13 +0000
Bradley Morgan <brads@mainlining.org> wrote:

> CSKY has no two-byte atomic compare and swap, so the __cmpxchg()
> switches in cmpxchg.h let case 2 fall through to the undefined
> __cmpxchg_called_with_bad_pointer(), failing at link time. Route case
> 2 through the new cmpxchg_emu_u16(), which now takes natural u16
> arguments, so the (uintptr_t) casts on __old and __new become (u16)
> casts in all three switch instances.
> 
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  arch/csky/include/asm/cmpxchg.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/csky/include/asm/cmpxchg.h b/arch/csky/include/asm/cmpxchg.h
> index db6dda47184e..e53628268e8c 100644
> --- a/arch/csky/include/asm/cmpxchg.h
> +++ b/arch/csky/include/asm/cmpxchg.h
> @@ -65,6 +65,9 @@
>  	case 1:							\
>  		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>  		break;						\
> +	case 2:							\
> +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (u16)__old, (u16)__new); \
> +		break;						\

Did you check that compiles?
It needs to compile without a warning when exchanging a pointer type.
I think it would be better to make both __old and __new 'unsigned long'
adding a cast in the definition/assignment to convert pointers.
aka:
	unsigned long __old = (unsigned long)(old);

(The cast on the call is separate from the type of the function parameters.)

Not a new bug, but there also doesn't seem to be a pointer-integer type
check here (there is probably one in another architecture).

I think that means these compile:
	int i;
	int *p;
	...
	cmpxchg(&p, 4, 5);
	cmpxchg(&i, p, 5);

Simplest fix is probably:
	unsigned long __old = (unsigned long)(0 ? *__ptr : (old));

David


>  	case 4:							\
>  		asm volatile (					\
>  		"1:	ldex.w		%0, (%3) \n"		\
> @@ -98,6 +101,9 @@
>  	case 1:							\
>  		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>  		break;						\
> +	case 2:							\
> +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (u16)__old, (u16)__new); \
> +		break;						\
>  	case 4:							\
>  		asm volatile (					\
>  		"1:	ldex.w		%0, (%3) \n"		\
> @@ -132,6 +138,9 @@
>  	case 1:							\
>  		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>  		break;						\
> +	case 2:							\
> +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (u16)__old, (u16)__new); \
> +		break;						\
>  	case 4:							\
>  		asm volatile (					\
>  		RELEASE_FENCE					\


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
