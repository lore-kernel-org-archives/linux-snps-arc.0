Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78270C982EA
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2026 09:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=as9VZGqMF5AWGfiv0LK8SccerFncRpwmuM7Ae4y8Nww=; b=P0J82ArrWT2gca
	1s6CCxG9uFqv0ZvkzTVSjqZRXRhCsEN82XOGX8v82EmmoHcfB83eVMNg2HrESh+TWxz0gz1KXRNJg
	7g82mbF8MvZPc0IJseOtLQlR99hn9Id5wzEk5SaXgF0gvyjdo+ApOCt/N0q7wBVma0SoFAfEfaDzR
	9523op9g7VDkxV2KR8o4IgYuk9/d+SCOGYCZ6llloStcI0pt5giycig0s6nHPx2yYVY77DOfqBFj+
	hCOOBsUddOHXyewpKN6KXCDySoI2Zo1hL6W6lJM2/N3uHHTDro/c0vxnq3vNPhatRe0EkJ0fQ54hA
	GLa2ZJJE/c5G5aKP0CCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JLQ-00000007jqJ-3Zx0;
	Wed, 23 Sep 2026 09:32:53 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JLN-00000007jpR-1gbc
	for linux-snps-arc@lists.infradead.org;
	Wed, 23 Sep 2026 09:32:50 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b91369d18so4687235e9.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 23 Sep 2026 02:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790155967; x=1790760767; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N7ccE9C9Rji5d1/6O5twnMh1K4GrGyorEDQqGjRm4Rc=;
        b=caoAh1aS1n2QMeDWP4H/9zZYhMfuNKkV/c00ZsdZrh0imNDaKVVtyKoUpivCNQtFFk
         9W1RpBmk5JrSgzCsYs/LrgQMnD1xHM/IBCqTDvR8Ky6Gjrhmduaf0O8wg+CPs04x4nfv
         SsBlqVd01hwI0LxxXyRfpASDl1pfYP6AENnqzuY2xaUQYfhOzmJb6CwUYBMJYQUjWqZa
         sXgxosYW7I94Fu6MJ+b6F+MSQsJRg1/gKt8SpzyEk4tG7cXeG+VNY2SHUqO9G7gU4wr9
         eqQGxH2skZByqkDVXBFuV3akAMohg+05jzguTX4kbjQEfBhIqoQbrzWqMLptHAf4NTae
         kd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790155967; x=1790760767;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7ccE9C9Rji5d1/6O5twnMh1K4GrGyorEDQqGjRm4Rc=;
        b=sl9GWJlQO16iDYKWhuy1Vknh1lvR1CsWzmSzYpkJNo/lsPr6cOdtXpdxOQq1yd3GqO
         2ZgXyMga1hXTo4yskNrTfa5egxbdI2S73NI+8bnLlC4Xu8/KMl/S1FvBROfrXoHrnUJI
         7sk4/7OzvxrQmnuW5o+h7hXU8FJ7UMlhy2w2WAkAnddqEgQB5OqPOPZgd0CcY63ajEUA
         3EZqulVEmUJp8+jFn2j78dNrS7w92oL4gRUslC+7JTZNFGUInHCp6eGJ8HrQBKnTpTfs
         L/DJRbHIuBhraALDD/O6XIxpymwfrYCIuRgL3ci0z53vK1PVl6G4qhzbDCpJ6TzEbr7C
         ZK/w==
X-Forwarded-Encrypted: i=1; AKwUvBwduVKaWOW2RQFVbR2Gla1NnqWUSS8CDQayd0s4vWg5TVu9E7LdMSzBi/PubgSfZTOhCM1UvMWe6qlm+w+0iw==@lists.infradead.org
X-Gm-Message-State: AFuF++mfc2evdOgyKokazQ48oA0fiOhinCRfgmt+/YtiNHNw4UJ+GN/3
	0RVjMnjfqwVZwVz3AvD+LNGzvXzwyhOMWU8LxGXr09RfkHsz/2zezVhT
X-Gm-Gg: AYBFou3gshKVpOFnH5UdA6gb5SRcR+ZJBTGPv+9BOE+R0PxLPwQvN+tEMjYVS4WxOUk
	CDHswr9a4IZztk07KkYwkOejdsdW6Oli51vmqSEwglB70lgtA6OWpMt2CoWzw64pd3xuMhFMOoS
	jYl3N1WF7Whp2+Vl5Q0J9O4gOD0PajePfJfK0B5ThetM5jcf1Ffs02JWNeoRT75YvzHYERB76+p
	yNDlzh+RgravpXvh4cyW95RorSzMF8dt3Qybsclo/isxst1ksuFWkrO9I0vuZWvROCmtThC3T+6
	Usl8ky+p87HNPeVT0OjHxaYEgqKea0qXOUqLns16Idh3qfcAs/tHxKXJSTxAObsYfOV2Gt8rbrS
	V/+Kr8AkjvpCvtEk1VdIYTVUm4o4Fb7xoubsdN2uW2z4s92ebM11vI7xMnqFw5nTzTBAmXuQDEU
	L5C9if0m00Ovl1MFut4mOrGmO8QEo6iI6K1WTI+B3wWyNySNWrtLQk+mZEPjYvqUMhrQIfcmCIG
	gvOP4lDX8kuFNFxNfXWxbC5wcLYRTqcKBc=
X-Received: by 2002:a05:600c:4f4f:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49fdee0afadmr31059425e9.2.1790155967384;
        Wed, 23 Sep 2026 02:32:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1aca52sm64655025e9.14.2026.09.23.02.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:32:47 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:32:45 +0100
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
Subject: Re: [PATCH v4 0/5] Add two-byte cmpxchg emulation and wire it into
 the architectures
Message-ID: <20260923103245.4c13e90d@pumpkin>
In-Reply-To: <20260922173354.14404-1-brads@mainlining.org>
References: <20260922173354.14404-1-brads@mainlining.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_023249_469636_DD7E532C 
X-CRM114-Status: GOOD (  22.20  )
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

On Tue, 22 Sep 2026 17:33:49 +0000
Bradley Morgan <brads@mainlining.org> wrote:

> This is v4 of the two byte cmpxchg emulation series, wiring
> cmpxchg_emu_u16() into arc, csky, sh and xtensa.

Apart from a minor niggle, for the series.
Reviewed-by: David Laight <david.laight.linux@gmail.com>

> 
> v3 had changed cmpxchg_emu_u8()'s success return to (u16)old, which was
> a 16-bit mask in the 8-bit function, and a dead one at that, since the
> compare guarantees the low 8 bits of old are the byte being returned.
> David Laight asked where that cast came from. v4 returns old unmasked,
> the exact behaviour the one-byte emulator always had, so nothing that
> uses cmpxchg_emu_u8() through the widened prototypes sees a change.
> 
> David also noted v3 extended the (unsigned long)(0 ? *ptr : (old)) type
> check to csky and sh but not arc and xtensa. v4 adds it there too, so a
> cmpxchg(&p, 4, 5) fails to compile on every architecture in the series,
> verified with each architecture's macro instantiated standalone.
> 
> While adding the type check to arc, the switch subject turned out to be
> sizeof((_p_)), the pointer, not sizeof(*(_p_)), the pointee. On 32-bit
> arc the switch was always 4, so the size 1 and size 2 cases were dead
> code and every sub-word cmpxchg() went through the 32-bit llock/scond
> pair, comparing whole words against sub-word values, so the compare
> almost never succeeded. The switch now tests the pointee, and the u8
> path it was always meant to dispatch actually runs, so the one-byte
> emulation works on arc for the first time since the sizeof bug landed
> with the original cmpxchg_emu_u8() wiring.
> 
> The host test of 972 cases across both halfword offsets against a byte
> level reference model still passes, and a 20000 case randomized run
> checking the masked compare and return against a hardware cmpxchg r16
> model passes with zero mismatches.
> 
> David pointed out on v1 that a u16 prototype does not compile warning
> free when exchanging a pointer type, because the switch statements in
> the architecture macros instantiate every size case, so a pointer
> cmpxchg() type checks the two byte case, and the (u16) casts there
> warn. v4 keeps taking the old and new values as unsigned long and
> casting to u16 inside the function, so the call sites need no narrowing
> casts and pointer exchanges compile clean. The function still compares
> and returns exactly the 16 bits the caller asked for, which matches
> hardware cmpxchg r16 behaviour.
> 
> The ARMv6 wiring stays dropped from v1, per Arnd Bergmann's offer to
> take the INTEGRATOR_CM1136JFS cleanup in his platform removal series.
> 
> Bradley Morgan (5):
>   lib: Add two-byte cmpxchg emulation function
>   ARC: Emulate two-byte cmpxchg
>   sh: Emulate two-byte cmpxchg
>   csky: Emulate two-byte cmpxchg
>   xtensa: Emulate two-byte cmpxchg


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
