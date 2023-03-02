Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D20C7EE45
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Mar 2023 03:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6avqkSOL0ObxuriOqhxFwvxvSxB3H9MtUJ245zkvM/U=; b=OQ//2PE1PmJPOH1VzmkSDF5zVp
	kJtPXvMtmldua08U24yhBpRizpBr3Mhzssh1xOjJQOGIfu8sc5LNv5kge4yyNmHF7QaKqpgzXQo82
	kEFyk8shOcCP8SECQHNPHqZ3wqs/+XtloNM7+jsaS7Kn9kq9Y4agdvNMnxQ4ZVAP5eLCCZnXxLZ9Z
	8kzCYR8bOHjcmIJe027mpxcb6xH8eKJDiHUUjkrZkM9ubM43KHtgEgqWq0m/AvfPFVvGgiw2SjrBT
	aJJJ5hYAho5tUfvGDcnXY9LPm/VZMC/nx72wQC9nNsYCRNI6vDre69E5/+cuxohILUvZegO9nC/ru
	b3gVv15Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXZRf-000eDl-SC; Thu, 02 Mar 2023 03:17:27 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXZRa-000e86-JT
	for linux-snps-arc@lists.infradead.org; Thu, 02 Mar 2023 03:17:25 +0000
Received: by mail-pj1-x1033.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so1364094pjz.1
        for <linux-snps-arc@lists.infradead.org>; Wed, 01 Mar 2023 19:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677727038;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgpf8cgLJj50M86L5F9BUoIAMwjT++SeEfR1/zwwwE0=;
        b=05BK9h2oN73d+vLQZ8AXICX+yqZH9PJw8eGQwQu3aLpPw/PQkKLBM+zl4FHFPDCMbr
         oT2a7ycW9j4IvNJVs7ZNd3qeiw85Qtha4m0oAo5Q0QiPipyRwzSV4J3XcelEef5d8yqB
         I4KXQDK7qQ+mAPYeZvAqQG78vIyZoGQH/5i1rIXtVNLbcQNF9Kn0gW9O7HWaBv1Z1Hfx
         4q2OGZuaoqmuPypq3KgIWVltCxcy5gmQYJ+016KcQmuC/U0yrGY0o6z+m+PHYIZUzGYI
         1grLiGwuTn7D4jkc5r6I/7tUA73EppBwvM41vkni8yrDAA+aUFBNlGO/ZUE432ubFqlh
         lUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677727038;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgpf8cgLJj50M86L5F9BUoIAMwjT++SeEfR1/zwwwE0=;
        b=CD1NMz/i7VhwZ9qBh0wVZ0CPkfAcM5RHH2UMDkAX9khGRaH2bEXqOfFf/j5diwhEoY
         SseltBtsyoHqWiUmin4AKC9oCjfciE7Xc9qBcF2Dh2GQqw2bTzo8bB9hhPwdAemR9cay
         Rhr2gAHt7rBQEdH866j4bar54qFrCAR4W9pQYdVIp9Fv1MZJWHI0im8C+D++f2/KWnN9
         um9Tnt0ykPSsmmqtIyGk1BLh8RFU+m2tE+Hq9QeJ0BH4jBq0jn6h3p3/uAYUAhNbkdfN
         oIlRDr2fiF9kld5HjUu+2CAGmMf2UQ6zXyA09t9iKm6u9udU90Vr/HXu1KSBzaa/D109
         FYBA==
X-Gm-Message-State: AO0yUKUt1rBpYFbUuyx4wd1kXJncoAiWtXHfJxaXbt9YHO7xdbYZd4sQ
	G3ZDbF1/PkNCteJDoycDBCLf9A==
X-Google-Smtp-Source: AK7set9sdV/+BdUm2bBjL395AsIYL1A1j9eCLS8ecMxY0Ws8WD4l1oqL273WzlVwyO1Yv4lm9xFKPQ==
X-Received: by 2002:a05:6a20:1bde:b0:cc:de56:957a with SMTP id cv30-20020a056a201bde00b000ccde56957amr8709472pzb.13.1677727037881;
        Wed, 01 Mar 2023 19:17:17 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id h192-20020a636cc9000000b00502f5cd216bsm8183287pgc.6.2023.03.01.19.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 19:17:16 -0800 (PST)
Date: Wed, 01 Mar 2023 19:17:16 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 18:55:30 PST (-0800)
Subject: Re: [PATCH v3 03/24] arm: Remove COMMAND_LINE_SIZE from uapi
In-Reply-To: <874b8076-b0d1-4aaa-bcd8-05d523060152@app.fastmail.com>
CC: alexghiti@rivosinc.com, linux@armlinux.org.uk, corbet@lwn.net,
  Richard Henderson <richard.henderson@linaro.org>, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@kernel.org,
  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, chenhuacai@kernel.org, kernel@xen0n.name,
  geert@linux-m68k.org, monstr@monstr.eu, tsbogend@alpha.franken.de,
  James.Bottomley@hansenpartnership.com, deller@gmx.de, mpe@ellerman.id.au, npiggin@gmail.com,
  christophe.leroy@csgroup.eu, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
  svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net,
  tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
  hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
  linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
  linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-78901e66-16df-4563-9e2c-3a9744ef2828@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_191722_693049_AA888D15 
X-CRM114-Status: GOOD (  29.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, 23 Feb 2023 05:09:17 PST (-0800), Arnd Bergmann wrote:
> On Thu, Feb 23, 2023, at 10:54, Alexandre Ghiti wrote:
>> On Wed, Feb 15, 2023 at 2:05 PM Arnd Bergmann <arnd@arndb.de> wrote:
>>>
>>> On Wed, Feb 15, 2023, at 13:59, Russell King (Oracle) wrote:
>>> > On Tue, Feb 14, 2023 at 08:49:04AM +0100, Alexandre Ghiti wrote:
>>> >> From: Palmer Dabbelt <palmer@rivosinc.com>
>>> >>
>>> >> As far as I can tell this is not used by userspace and thus should not
>>> >> be part of the user-visible API.
>>> >>
>>> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>> >
>>> > Looks good to me. What's the merge plan for this?
>>>
>>> The easiest way is probably if I merge it through the whole
>>> series through the asm-generic tree. The timing is a bit
>>> unfortunate as we're just ahead of the merge window, so unless
>>> we really need this in 6.3, I'd suggest that Alexandre resend
>>> the series to me in two weeks with the Acks added in and I'll
>>> pick it up for 6.4.
>>
>> Sorry for the response delay, I was waiting to see if Palmer would
>> merge my KASAN patchset in 6.3 (which he does): I have to admit that
>> fixing the command line size + the KASAN patchset would allow 6.3 to
>> run on syzkaller, which would be nice.
>>
>> If I don't see this merged in 6.3, I'll send another round as you
>> suggested in 1 week now :)
>
> Hi Alexandre,
>
> I have no plans to still pick up the series for 6.3. The patches
> all look fine to me, but it's clearly too late now. What is the
> actual dependency for KASAN, do you just need a longer command
> line or something else? If it's just the command line size,
> I would suggest that Palmer can still pick up a oneline change
> to increase it and refer to this thread in the changelog as a
> reference for why it is not an actual UAPI break.

Sorry for being slow here, I just queued up the original patch in the 
RISC-V tree and intend on sending it for 6.3 -- the main worry was that 
it's a uABi change and we're confident it's not.  It's late, but I'd 
prefer to have this as it should let us start running syzkaller now and 
that'll probably find more bugs than this is likely to trigger.

https://lore.kernel.org/r/mhng-b5f934ff-a9bb-4c2b-9ba6-3ab68312077a@palmer-ri-x1c9a/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
