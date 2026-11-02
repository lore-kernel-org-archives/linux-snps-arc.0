Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF07606A32F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Nov 2026 02:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q7mZioRo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lDEasyOZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kFnAUEmaP8WuFXF6XjbPYVoLRpsjllpLK3PJRbiJPiA=; b=Q7mZioRo0SIgt5LtqzkRoNIFpr
	O8q2Lud9wSZDlcBqANu7OvjPihHJWGQZbK6dPu2IyEtyDluiG7CAK+CUD0Y9G5pFdi/vThVPw4lMx
	b7RHqPTu5qfRpz1X/LYgbqjEaQsF0/DNTeEz6cu3H6STW2qhPb1qWXFzdxO+B9Nd4hWMe6rxIeGIy
	w49EdZY4JdFdRQrTzlDLzihqU2geu6rnqADD5jhM1x9qKZ7CkVvcuFPEfGdhA5bhPiFWl2YUhKqL+
	I1N4ZAhYeJGNVljAG92ZiEVXM9xPxX5j41AC7hCTxi2QYvJhrBVqEidNUbkavwEVjiR0XhRwDGav8
	mjLFqR8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNi4V-0000000FPke-19r9;
	Mon, 02 Nov 2026 02:46:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNi4U-0000000FPkX-1FiN
	for linux-snps-arc@lists.infradead.org;
	Mon, 02 Nov 2026 02:46:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C0E843396;
	Mon,  2 Nov 2026 02:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188E21F000C1;
	Mon,  2 Nov 2026 02:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793587613;
	bh=ehSVwJnZsQDg84XvU5Qm6Wr9d1iEgzWRDQ26X3vNtN4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lDEasyOZsZTGgnhZh8Px+AlBq3R8TivOBu8Fe8FadYhB+7OTHUFNkRsODjKU/ql1S
	 2p5TqhAcLpbTuCwsQRBtLmoHih5wQ+0azOX+f+5KupO0kZUT7TqD7xHrxcjA3bGjme
	 qb7wrGHJ/lb//e1nxvbBDW63ECTROjd+79HbziG4b4QQ0cQlFms/v8u3Cdqy/wclav
	 WfgdUP3n3HZpbjyaJ9h8Ibi5HihN+ZUInJHSagBYN/tWQApHEbTzLQmxtrZTllYjLA
	 0k4EfJXAn2TAINvP6d57nafE/aNx0er5HA4+VxdLqe6YMdA0qfY5wwG2W4V3J4yPSx
	 R7TuDou5+qj8A==
Message-ID: <adeb8dc8-1cc9-4297-8d34-3f4b0e2f4e8e@kernel.org>
Date: Sun, 1 Nov 2026 18:46:52 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARC: Strip libgcc debug information when generating BTF
To: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
 Sasha Levin <sashal@kernel.org>, linux-snps-arc@lists.infradead.org
Cc: Andrii Nakryiko <andrii@kernel.org>, Ilya Leoshkevich
 <iii@linux.ibm.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
References: <20261015154044.4058618-1-sashal@kernel.org>
 <09db4d22-2836-4656-8c6a-a7e5377710fb@kernel.org>
 <8b4688ca-db5c-4122-b616-8e3964e403f8@app.fastmail.com>
 <7de128f0-4f17-4a33-9a7a-14d5bbf62e64@kernel.org>
 <ca697a3c-fee0-40a9-98e6-12e24febb3b7@app.fastmail.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <ca697a3c-fee0-40a9-98e6-12e24febb3b7@app.fastmail.com>
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/1/26 11:45, Arnd Bergmann wrote:
>> Oh that fits the bill perfectly. Mine also switched the others (with
>> build test using their cross tool-chains).
>> Anyhow I'll wait for that to land. Would this need to wait full cycle ?
>> If it can land in 7.4-rcX, I can hold off my existing patches for
>> switching to current in-tree lib/* to also use the new ones and be done
>> with libgcc.
> If you need this to fix the regression, I think it's fine to merge
> the shared lib/*.c files for for 7.4 along with whatever you need on
> top. I suspect though based on Sasha's patch, the only thing we
> actually need is to stop exporting the floating point functions
> so the types don't leak into btf. If you can verify that this
> is the case, I would do the full conversion for both nios2
> and arc in 7.5.

Yeah Sasha's fix works w/o eliding the FP routines (there's an unrelated 
issue which I send a fix for [1])

As of 7.4-rc1, I have 2 ARC only changes to
1. Switch to existing in-tree GENERIC_LIB*
2. Dropping FP symbols

I can post them now. Once Simon's changes land, lefover ARC conversion 
and and removal of libgcc can all go together via your tree if that's OK 
with you.

Thx,
-Vineet

[1] 
https://lore.kernel.org/bpf/20261102023638.1621622-1-vgupta@kernel.org/T/#u

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
