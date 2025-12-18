Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95724D6ACE5
	for <linux-snps-arc@archiver.kernel.org>; Thu, 18 Dec 2025 11:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZZIu794g4a+qURFPCuQJVloKYmB8lZ01AOZbYkPYq0=; b=asbjoPW8bmQR5I
	xIw514uR/kLKjeizowexYpTQgGxMrsJYFN50qh3W3aDKy6Zl8e1ZouVXn/V2hDqlKmeT35zOAibKF
	FIHPkV86/34UqPu3US2HX7Nmvl7hH/+oHIY41O0fhU9VY6Psm65zqmtpM4kZHgsW3G7g166EFPLg5
	Ka9vPS81obxx/ZzkiKvJzdvnpjrfy/x9tdv4C4eXHRw+F/LsRaXx471mCwvBvvm8W5cKblWbNrhu6
	gfoPFytw71dOx92ez08j92OnX7Wpvxp0oJkpquCCUEuFPtlDCiqR5si+QX5Aso9ncgDqazYy2AxrK
	PZ3ljJ0m/MSKLEPjVGSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBsH-00000008I0n-2ZGi;
	Thu, 18 Dec 2025 11:08:49 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBsE-00000008I0F-1Iob
	for linux-snps-arc@lists.infradead.org;
	Thu, 18 Dec 2025 11:08:47 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so456618b3a.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 18 Dec 2025 03:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766056125; x=1766660925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvrOODWWF0yZN0kTruhNLT8tt7pIP8wMKuLRwhFsSME=;
        b=Ps1lK3Zp2kuZrrZZtL8KznaJURplOpJ/r+A8XHp8pREMk5ktfDGsYArhvhcn7H741r
         V0DN/rPap5X/r2+7UuAhNOuQcZkGPULhJg7XYsR5XYIwb5wmwJ6MmdWiXuyvnVz1/46c
         b3YPdUG1eIxS/PEwSQP0pTZeysZHUhUHeESJR+ceQ8iqrUGHdOnvsZ2K8nA/DzPBLsqf
         WIy5shYhTYpA8PCJCea1h/cfUIwIl0Im94lJawHIU852j7o34VYPg4uYSs8ZWZB/p1dK
         EhRAtB1wKTerK2jghT+QwKnQ4+WX5oHhjutyoaoDBeINg2V2saC4ysbduWlIqTdzyyzt
         1csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766056125; x=1766660925;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvrOODWWF0yZN0kTruhNLT8tt7pIP8wMKuLRwhFsSME=;
        b=nYcuInMdyowU2oLRZU4Bek+X3R7sZO4MZvNqKGkufMZVpSO5SdFkiiBXjMfLZf9wSu
         1oFGZi4UD6CBSdVbOgQlfUceWu2/zIN++uD6aSeDv1UkN4uda/xaIdNakPskkNL2wHmV
         ujf5BlcKYWpmvsPCxxinOxEj/BfGgVRBg4v1uIlvJ/9mbcyDkrTW7LgPxZV9uKHDLtH/
         YPaAQRzEf/IXK5tRaXTB/iJNk9wK2UcHeiHFJpAg20wPJAL34b1CMpE8w58P7dJ0qsGy
         RgKRB3lCSSHija1E+vxC9d6gCq4QjPAoL3FoGT8v8mOSfwVApCHT8CaSiG+Dn9NbW6Iv
         uuLw==
X-Forwarded-Encrypted: i=1; AJvYcCW+eEerWjxmZJ0ul8c38ofnOW61szyL+ghd2Z2csFPtUQaMhjmOEEFSsPq0hzMPfRnu4JykUQhbvHrbh3ibBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgKHS4NZwgOMB8CwdrgEZONuez/92p5xl3/aBOuKSshefaLZ70
	oFLD3U8mTDy9xAJnmz80CWZ1vqrKxu5NUT0L1yufNChwUBM/TF66P39O
X-Gm-Gg: AY/fxX55iS6/qiNuesD8P08KWXIjWuzquJ3GlA5/SehsZui6Oav4eXl90dBAm30PluR
	ywPK57HFzyOIxhNoEan4jQ4GvEJCqXi++/WzOXFuVuV600kajWIGHPuWfU1zsRgh7MR5RSdIMOe
	rn2cm2PvbrmNffB4r6rAiHn7tqXHhCE0LdQYvrVw9ol4/5hUKNi80Me14MDDu6ixZdWeGT88Y3P
	7e/sRSTwq8F2hLTCl+hiroq/u7TM2HrfEUjDsS+IIklGeGnxphu/2W3q1zLmGNtrQj/rBrheG/X
	PJablms7ECcDHtwYXRo1AqzhhJeForwVfVpBgWmZyzzNLHzSN+RJl4XkiWjupfYUE16Spl6noQy
	CqERR29EoR2Nb8ocOvvPQ5TjgYP0o+Irv+Ix6VCW1JM08mjwl4O/GUyoeX1+qwENWGRcDONjnc3
	DFMN6NcQ7kthb9+memfdbOmWn35dtAp1Nf/YLrHaKY7n7Vw2Qlz69JG0ny2LShHq+g5p4=
X-Google-Smtp-Source: AGHT+IGAV2/r1YTG/myMJw8Xx7HTeJ86vOJi7XK0y5urcjohswz9dbr215J8uix2rwoqrzjY/V5ZRA==
X-Received: by 2002:a05:6a20:7343:b0:366:5332:466 with SMTP id adf61e73a8af0-369affec42fmr22254047637.53.1766056124849;
        Thu, 18 Dec 2025 03:08:44 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1d2dc9dec9sm2029744a12.10.2025.12.18.03.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 03:08:44 -0800 (PST)
Date: Thu, 18 Dec 2025 20:08:24 +0900 (JST)
Message-Id: <20251218.200824.2202311883856399078.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, peterz@infradead.org,
 will@kernel.org, acourbot@nvidia.com, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 James.Bottomley@hansenpartnership.com, deller@gmx.de,
 linux-parisc@vger.kernel.org, davem@davemloft.net, andreas@gaisler.com,
 sparclinux@vger.kernel.org, vgupta@kernel.org,
 linux-snps-arc@lists.infradead.org, bcain@kernel.org,
 linux-hexagon@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 0/4] rust: Add i8/i16 atomic xchg helpers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aUPG2Q_sSPDnlQ0G@tardis-2.local>
References: <20251217213742.639812-1-fujita.tomonori@gmail.com>
	<aUPG2Q_sSPDnlQ0G@tardis-2.local>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_030846_358726_B0FFC258 
X-CRM114-Status: GOOD (  18.01  )
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

On Thu, 18 Dec 2025 18:18:17 +0900
Boqun Feng <boqun.feng@gmail.com> wrote:

> [Cc parisc, sparc32, arc and hexagon]
> 
> On Thu, Dec 18, 2025 at 06:37:38AM +0900, FUJITA Tomonori wrote:
>> This adds atomic xchg helpers with full, acquire, release, and relaxed
>> orderings in preparation for i8/i16 atomic xchg support.
>> 
>> The architectures supporting Rust, implement atomic xchg families
>> using architecture-specific instructions. So the helpers just call
>> them.
>> 
>> Note that the architectures that support Rust handle xchg differently:
>> 
>> - arm64 and riscv support xchg with all the orderings.
>> 
>> - x86_64 and loongarch support only full-ordering xchg. They calls the
>>   full-ordering xchg for any orderings.
>> 
>> - arm v7 supports only relaxed-odering xchg. It uses __atomic_op_
>>  macros to add barriers properly.
>> 
> 
> Thanks for the work! And please do Cc linux-arch next time when doing
> architecture-related changes. We would get more experts to take a look.

Will do, thanks.

> I think the current implementation expects that xchg() work with normal
> store/load, and that requires ARCH_SUPPORTS_ATOMIC_RMW. So could you add
> a comment saying the current implementation only support
> ARCH_SUPPORTS_ATOMIC_RMW architectures? And when you wire up the rust
> helpers, I think using #[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)] is a good
> idea. This will at least let the !ARCH_SUPPORTS_ATOMIC_RMW archs know
> that something is missing here.

I will add a comment.

ARCH_SUPPORTS_ATOMIC_RMW is required, but we also rely on xchg
supporting i8/i16, which is not currently required on the C side, I
suppose.

As I wrote, at the moment, the architectures that support Rust
(x86_64, armv7, arm64, riscv, and loongarch) satisfy these
requirements, so my plan was to use cfgs in internal.rs to restrict
xchg support to those architectures.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
