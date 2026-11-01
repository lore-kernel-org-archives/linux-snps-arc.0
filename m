Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E00606A32E
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2026 18:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yjKnCTE5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ECEW+2J7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S7tJReZiprlbv8A0ofRG3Kb4WBl3oEU7niP2yNrCG7I=; b=yjKnCTE5od/he9D9vdqPwtQ8ZW
	CJ7S9Q/OVhGCPWtRy/EEtcKZ5PQ1n4hu7xWrvea/Z+fWR8cMmGAuUkK+TElzd6eEus/Y8hniGOYXo
	tD091P8bM0rszlOfIuzbQx8kW+11xUoW88/lbVihvUlNYOkoKM8mVwczazar8kllPjL5ALUmxwFsM
	mnj+1519JRhKInX2V5Sl+63VD5RJxee2+iY7IFo12220r6BOHfme8N/PApaDKKGYEh8fCh3ljRItt
	QyV/c/EClsjPhLe0fV3RXdW9Qvf+7/PR+CvdxJnNGABnwjJea1LeIkehBweA4myAmEtYo9UlQZk5A
	v5NRb6Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNaSK-0000000Elm2-2SyQ;
	Sun, 01 Nov 2026 18:39:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNaSJ-0000000Ellt-0xXH
	for linux-snps-arc@lists.infradead.org;
	Sun, 01 Nov 2026 18:38:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D1C64199D;
	Sun,  1 Nov 2026 18:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9D41F000C1;
	Sun,  1 Nov 2026 18:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793558338;
	bh=P2cTxEodlx1mrdaG6vZ5j/uK66L7NEyql53bANo4ga4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ECEW+2J717K/PqiIzx364cFS24fmMPWhzn+o8gUmJ3wcW5j+eTuzyDQ22rz5jHykW
	 B8tunzAMu1i/sKQiPt8RVU3Yz3XYKdSxRFO0oou6XmPAgmZS9TNapo94xkdceEQb3y
	 nVI1UMJ/ePQc06xou58jNbOutxSbQ4Sj7rC/fJ7w2GzktJrz+RUpZ9eTlEvVAYAcgl
	 043Bh1Hs5iyarvncHZ1bogAIIxei33gt4KRPVe2ZsaAwoJPfQHb3G2LHEV38ul1wKR
	 mHul8kLIlpHjITnGyi1I9U9MPrkYrVLo1DrvlKQ/RGaU22TQ1CDeY9BZwDmKQWEmOL
	 6CHCKJOnNLGNA==
Message-ID: <7de128f0-4f17-4a33-9a7a-14d5bbf62e64@kernel.org>
Date: Sun, 1 Nov 2026 10:38:57 -0800
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
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <8b4688ca-db5c-4122-b616-8e3964e403f8@app.fastmail.com>
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

On 11/1/26 03:09, Arnd Bergmann wrote:
>> I'm working on getting rid of libgcc linking for ARC.
>> This requires adding some GENERIC_LIB_* routines, but as part of that
>> series I'll propose a revert of this and then the dropping the first link.
>> Don't intend to revert this per se, but revert just makes it cleaner.
> Have you seen Simon's series?

No I didn't until now.

> https://lore.kernel.org/all/20261030-nios2-remove-usage-of-libgcc-v1-3-4e341c66082e@siemens-energy.com/
>
> I hope there is some overlap with what you need for arc in the
> lib/*.c functions. I can take both through the asm-generic tree
> to reduce the dependencies if that helps.

Oh that fits the bill perfectly. Mine also switched the others (with 
build test using their cross tool-chains).
Anyhow I'll wait for that to land. Would this need to wait full cycle ? 
If it can land in 7.4-rcX, I can hold off my existing patches for 
switching to current in-tree lib/* to also use the new ones and be done 
with libgcc.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
