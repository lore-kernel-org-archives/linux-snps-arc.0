Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53025606A326
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Nov 2026 07:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3GuHhWNK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=jFbeXVtE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mfFhQIcb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=7OR9raFoj/jgMgXOH4iHUHAUdSQZ5zxfO4D/QwRgP30=; b=3GuHhWNKd8DRmnua7xk3rx+OXs
	nK+VxNqQn5BXSnPNhgstweaG7OjUEu2qUcrMyg+klLqNOvRmqFolF/CLJPZUD84c0C2rC7rfb5ApQ
	oOWXPLU8Z/q24cWJxt8k6yiqvSfKwgVGe/dGVZY3h1ZZNZHaDOAojpmsubK0+rKJXzz/gOs5zJ2b0
	IDRLPK4i0FcI/wdqS+8GQCEdssbE1acLBinKTVA/uxIL+2kKyD7h2l5XohqCg4SCqXKjT2lxY2xS5
	0ktGZ6mxCEG2vkiC2BAlNk2DcgQkPu9DsAN2l4wbcr9+VYYigqx9Oxvhwi+/PAGFRENybpGjq486c
	vs2R4kDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwgU-0000000B5JQ-452N;
	Thu, 19 Nov 2026 07:35:54 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwgR-0000000B5Io-1zJC
	for linux-snps-arc@lists.infradead.org;
	Thu, 19 Nov 2026 07:35:54 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5C3627A0296
	for <linux-snps-arc@lists.infradead.org>; Thu, 19 Nov 2026 02:35:47 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 19 Nov 2026 02:35:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795073745;
	 x=1795160145; bh=ltmNxGzVMsUWBf9xabFvoUkFECbWVALmb0cBNU7b33U=; b=
	jFbeXVtE28RXyVKhBuRRzk3qfqOJqYhNwgBNaf9EHILXNdacMpQSdmzAglTT0Cd+
	izgQuSnE35pLmv6X30DAppduasnsXV8eDyx6mHngoZE1YtZexUi3wNB5JEx4M1aW
	JjgJZdIVokvCqP8iBxKMckwlmr+nDnqXeIOV58SJqhAqIYPw0CESH54ktZ8A0vIm
	SJ+pjWXcLdPgL7BU6BhlmbztgkQUen1aGbMrOOGLR3p4sXO5pqdA07sbAZUG6Orz
	UMmwBhSuJgmOx3TONsY2erx43Rujt25Qc+eVgr1tcMFePBMuZbv+KVPXRLiYH9Gd
	cMqiqemx4Yfv28Ulbhg5FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795073745; x=
	1795160145; bh=ltmNxGzVMsUWBf9xabFvoUkFECbWVALmb0cBNU7b33U=; b=m
	fFhQIcb+xt2lQcps1c+1SmQ7yYiV60zkIp1DkrA+qhdloUgF1wF63TecfNg+pMtH
	pUGRCWtTSV/yyWaYgqkkizq+wutbXLtwwqOBdhuYf18uDkWA/RBXUecBg/Xt7bch
	3GnlDbpHRvaj+c9NMwx0S+Rqf788Row5GcNhZI+qNiDzDddvV+jFGROU0k6vvdAU
	SXoiQKi/1Bksuic2wNbXpNmI/XqWTOMWI9q1tjfkLTqo497TXwDq/f5rxR/5/Jpj
	MBOTAKGACqr6uL2RQ7wP1TxZ+CseM732Q+sRjKyIXL6B0ReKooI419Kp7GQOTebG
	ZilU2hQd7CRCgyrjuPPLA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795073745; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm2:rsa-sha256:k7VlCLKlldiXxgkQhRrgHoR+hS3+ALMBEEa/Y7Jm8ff59gf
	TyMB6FMLui5sqiWDnKEnqhQgvjHSQYjiBODcKmhtueIsw8uQDB8CC9uBJFAc0U6a
	tBmvBfNgShkfi5c5Fwcqjw7wEffAr/OZjsMLJT8DexBwCRueTd6z42trqb3edIuE
	SG38cl23YjdJlxr2qhkHu67xj4ccZd1WFAlp2b0pR5X6W3rQUChRTYw6fpc2HKhL
	LU6O3fV/dLEPqFaSM5auSFhQ1Bnbo+MHzdtE+JQBDz6gg8OYZq60jYhU2LqQd49M
	zJoI7Bj8XJ3wIYapU5gG+bumWUlIBlR33r9lq9A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:kAnI3mhAJfu1iumxHnIfzhyuAZcd2dqmo0RuRGje7zg=:4TCtQq5w+UpIzVI4fky94aIGs1grY3Zu86iqwbUrhFM=;
X-ME-Sender: <xms:zqb-au9lGxYyT30Z36FZEz3dacwvy5_FyM-KgdkoKXSVKPjvfVxeBQ>
    <xme:zqb-apj0IR0g2c5wyxbod2MImG2Xubpp-9zuCjE_CxBZQILiqIkp_dS26z2mfExtf
    rXbMWamNgAyO3-FRGHA75-sv2P14XfSd6lyEUIfXhAbjuv2PmoFGnUN>
X-ME-Proxy-Cause: dmFkZTGbh2pWZ28YvSxw+0dcP4+tgoGjk0S895Ir+rX+p0A8ACFpBlozKOi5WmYMn6ibMC
    JQd+oztesAeL7AekbC3/u+rAQ9JbUfAopVvAn0RVC3+T/nZtZDfD4VWHEl+WOqsYgOgOY9
    hXZDdMpU/CCj2wFrjgL0YIjyWS1DCo3vR9qU4x5DkqUBwXlSjqGqFx1doOb8wIUgaunC+n
    Fr6NDu1VClMxS3B9afkohaNRdDASHrWCwNOR1AYe0gAJ956trAV6pw1YYPjXx/v70ph0tr
    sq/Lv/iM+6tvyZKAx2wlYaoKkMlkKNyl3GG9ko9dyzCoP40jWrQIcC+glmEF0PTfWIPKmB
    TJ9uIWgw5wm+32U8a86GWqGR/z0TYs0R+5tZ+38cPpVgn8x7+dc79X1T2DzrsqxCJN2zbH
    RWco12bnUs6s2WALm/yid/B/7gNJrcCA3MxSZx8MRWOau0+sqNIb41SOuxhmOq+WeHSQ/8
    +JWkwwr5+Jtjdwj+MDy/UVC/3sASj/D6E7YwMKNmdx/s4daD+LzXo8P+Oq+bgoiR6B3WgO
    zyLyaYbBVASRPQXRF96AWuPmhd+NDWdNCnqzQJaprBI4WZvgPpWGf95oaYc0EbGow+XXrA
    88xpaPD7X/khXq+j4zDcyNGCm6S5vrR8fVYHbTuzPwFGtP87omcYE7VbHH8A
X-ME-Proxy: <xmx:z6b-atIylWZ6lvEsjp97LRGVUf9esd8715ymIJK35w0n4Ut1zKom-w>
    <xmx:z6b-aiGpw7J1YW-VVkbgk4nw2jpcrUlnAoC3S7Xp3dnvSWJdSjhrKA>
    <xmx:z6b-ahTx58W2vYmG6zzzqi_bR5oDu5cOOPcTI1cs5Li7fHLLGaOtqg>
    <xmx:z6b-aufeOjTgjCwJspunV8hhttaY0XjqG9n8FeSjLr4tMnr_Vx7N7w>
    <xmx:0ab-apg544xyzacPwjCi5IAiWvNwxH6SIvLdH6e4TVyzQHBNjY_7cyg6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4F6EA32A0099; Thu, 19 Nov 2026 02:35:42 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AaT7K6j_YIN-
Date: Thu, 19 Nov 2026 08:35:02 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
Message-Id: <9572fc39-00e0-4ad7-b5b5-d83df573a589@app.fastmail.com>
In-Reply-To: <20261119055958.1621709-1-vgupta@kernel.org>
References: <20261119055958.1621709-1-vgupta@kernel.org>
Subject: Re: [PATCH 0/4] Remove libgcc dependency for ARC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_233551_805810_7B02F411 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026, at 06:59, Vineet Gupta wrote:
> Hi,
>
> Arnd pestered me to do this.
>
> Most of the generic emulation routines were present in lib/ flready.
> Thanks to Dinh Nguyen and Simon Schuster for filling in the rest.
>
> Vineet Gupta (4):
>   ARC: math emul: elide 64/64 divide and floating point routines
>   ARC: math emul: use existing lib versions of libgcc routines
>   Revert "ARC: Strip libgcc debug information when generating BTF"
>   ARC: stop linking libgcc

Thanks, I've merged this and the openrisc patch I sent into
the asm-generic tree now, on top of the merge of the nios2
branch.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
