Return-Path: <SRS0=vxQV=4A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091C6C35242
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 01:42:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC4EA2070A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 01:42:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VmLE9wNa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUEgfxpR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC4EA2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X992ZaKcFHOz/ey+tH39PDfg4T6nGqciJbPRbzvuZgA=; b=VmLE9wNaX6nxEM
	arcrbG6YhzJEzD5sfxVRZJUQurLdhymzIe8jm0B0cZeVKEHwNbnbJKn5f/qV1iZzeUnViSWuvzxSn
	EKTvb16U396TzQN3AZfm4+pVc9LUZjIws95Vdh1DWZ47N6FVcCHR1vHY0meFQc8ek6Fujsg8VEcOG
	/GZRq+4DfAY/pcTaZLah3tK35texKNc1WC/wexzOr99Epj8eJNAWmkyr89vl298k5is7Ktzoq0R81
	z7DCaUbI58sBOqKzseyB9yhUtDIPH0cwMOg3ISDmafchQnhPhGGrOkZhBQcA+ljCMatcKjQ83hCMb
	BIOYRcbCtyBt3GxZ4h7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1h37-0002ZK-17; Wed, 12 Feb 2020 01:42:45 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1h33-0002Yw-NX
 for linux-snps-arc@lists.infradead.org; Wed, 12 Feb 2020 01:42:43 +0000
Received: by mail-pg1-x541.google.com with SMTP id d9so342093pgu.3
 for <linux-snps-arc@lists.infradead.org>; Tue, 11 Feb 2020 17:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OpPdFJhHx5eLv8kfDp9Lkb2UTwiel/WAEfIcJde8Cnc=;
 b=HUEgfxpRnFTnmfYtwsMmzC7KyH2ZqHoSonZX2JZCRHeuqxdV8jys3MDXTjKrjlJUK9
 Qmq4mMF46MjVfIdezbt+dfeGoXlqWKFYc55mgZaK+u/MPXTJHphWSrbStgIMgOVR/33T
 USIzm937tayH7YQ6vH5Xn62i9ybvDO9mfn8xMIgi6fVw7VoC9BtbM0O9+SQzIN48qC2T
 h95FG6tuP/kATFpUPF+VfEKIgPpcYhxJgTwMMKIX0ONIYE6Ah9RbyNO3+4FSdDCtmbWM
 H0qAToiLvuko6c55ghW7mu9ctnV90NZ+8fxRfQ+XHPdDJ+YW7GxVd0/v+eQjr7dGMyFS
 H0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OpPdFJhHx5eLv8kfDp9Lkb2UTwiel/WAEfIcJde8Cnc=;
 b=UyBQKDBdIPmeLQKFFMP6YhNf5yGy9gABWAYrPE5cjpwfvneR2Gdp54lo2IW4KqiVQn
 QsBFTRPslJ3q/jjlTC4vZrnO3b8/OrJ8xaUE3zfBIZnEaOWeJLHmxZxYdoJBlGsW1Qdj
 B9yyzECehxMRqngJhQERfX4rRuivqJaYv7gCu8Y12j9H6Xvq3sWyrp/mSzPWdZwZV0CI
 kA1RPagRs+7xTDvIsWgQw12ahLxkMS537u8mTOYKHM3Hi6yghdYYOCPS9AqpquNF/DoK
 UvMcqO0y8oTNdc5JrIuefR6c5T5NXuvp463JEhg47WkShRUpw3BmvHhBL7Eu5u6y59wa
 oLjQ==
X-Gm-Message-State: APjAAAUWIwR/eJRbs6hnm1sJ/NW257W2DvwNyUMu7zVHoc3c1knHTu+5
 j20d3QkbdCUurgXYJltjQiQ=
X-Google-Smtp-Source: APXvYqxFx7hSG1Wn2z8Hnd+jwxws2K4/56+ixDHEY+fkPYNANvjL/PGxjF27ebmH5eCmVJmKanhIWg==
X-Received: by 2002:a63:504f:: with SMTP id q15mr9856896pgl.8.1581471759525;
 Tue, 11 Feb 2020 17:42:39 -0800 (PST)
Received: from ?IPv6:2601:641:c100:83a0:bc48:43a7:8508:65a?
 ([2601:641:c100:83a0:bc48:43a7:8508:65a])
 by smtp.gmail.com with ESMTPSA id 4sm5891938pfn.90.2020.02.11.17.42.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Feb 2020 17:42:38 -0800 (PST)
Subject: Re: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
To: Alistair Francis <alistair23@gmail.com>
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
 <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
From: Vineet Gupta <vineetg76@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=vineetg76@gmail.com; prefer-encrypt=mutual; keydata=
 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
 deE0Dvw98SWmZSNtdOPnJZ0D
Message-ID: <3ca7e2cb-55c2-1118-90b8-505586b36ee7@gmail.com>
Date: Tue, 11 Feb 2020 17:42:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_174241_796252_233D038F 
X-CRM114-Status: GOOD (  15.60  )
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
Cc: Florian Weimer <fweimer@redhat.com>,
 GNU C Library <libc-alpha@sourceware.org>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zongbox@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2/11/20 4:14 PM, Alistair Francis wrote:
> On Tue, Feb 11, 2020 at 4:14 PM Vineet Gupta <vineetg76@gmail.com> wrote:

>>> diff --git a/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h b/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h
>>> new file mode 100644
>>> index 0000000000..0da3bdeb5d
>>> --- /dev/null
>>> +++ b/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h
>>
>> I was hoping newer arches could simply use the asm-generic one ?
> 
> We need to specify that RV32 uses a 64-bit time_t. The generic ones
> don't do that for 32-bit arches.

Right. It pains to see that each new port (despite using asm-generic syscall ABI)
will have to make their own copy of something so fundamental as typesizes.h where
only a few things will change. The generic file is no longer generic :-(
Oh well !

>>> +/* Tell the libc code that off_t and off64_t are actually the same type
>>> +   for all ABI purposes, even if possibly expressed as different base types
>>> +   for C type-checking purposes.  */
>>> +# define __OFF_T_MATCHES_OFF64_T 1
>>
>> This is orthogonal to time_t but since we are on topic of newer ports, how are you
>> doing this. The asm-generic uapi defines
>>
>>         typedef __kernel_long_t __kernel_off_t;
>>
>> and types.h defines
>>
>>         typedef __kernel_off_t off_t;
>>
>> And I presume long on RV32 is 32-bits
> 
> Can you point me to the code? Last time I looked the kernel used the
> 64-bit versions for the syscalls on RV32.

You are right. I got confused with the types above: asm-generic syscalls on 32-bit
arches use struct stat64 etc which has 64-bit inode. Similarly sys_llseek uses
low/high parts for offset.

>>> +/* Same for ino_t and ino64_t.  */
>>> +# define __INO_T_MATCHES_INO64_T 1

I'm surprised that ARC port doesn't define this in glibc, yet we use the
asm-generic syscall interface where this is true. I need to investigate more.

Thx,
-vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
