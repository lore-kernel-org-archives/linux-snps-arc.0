Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAEA606A31E
	for <linux-snps-arc@archiver.kernel.org>; Mon, 23 Nov 2026 09:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QC4aa4fm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=fpxlC60b;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4MkzlCSf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=+dtQ24LQ1XwhwqbZHTL7TPhrDBdKiob6LgOcUNmgQ04=; b=QC4aa4fmmP9Zf6zV4m4UH978mV
	Vfk+O3yGHkBaeUjO07CInpZgWnjyS3zkT2k2kzrFSDj+EvMkpto5f3NyE1irYsU12rYNkc+a4NPju
	9SCthrWftKxTmp4yD7jcMOpH+F1oh8qVMWX1qN9IpXFJec8ESZknvt3ex38OS+P09ujCToNj0bxTR
	iuQgpfSQgkN9Mt2qHHBTPOE/TSDiqzU4Czsx8LscT/9bEo/lHeYxj60TNQmRBS5cofRwJDgtozFJe
	6XBwiv7R8SDfYX4X9G9xa5YUtPPVMGkS9VpQQ9x6l0gU4+PEt/oe4rKbNMPxfMhFTsiyirsB6uB8X
	dqoctR4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPwu-00000002eJG-3MiH;
	Mon, 23 Nov 2026 09:02:56 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPwj-00000002eFX-0XcV
	for linux-snps-arc@lists.infradead.org;
	Mon, 23 Nov 2026 09:02:55 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 829731400214
	for <linux-snps-arc@lists.infradead.org>; Mon, 23 Nov 2026 04:02:43 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 23 Nov 2026 04:02:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795424562;
	 x=1795510962; bh=mSMHW4SmZ7OYr+vBAy7Z/uvi3mUnomgOnauIX7oa3es=; b=
	fpxlC60bM6d+JfyxhTLEzy0J2w82OoNEjAhij7fAfezI05lGutEljsMTcwKO2VjZ
	Q+d3h0FtJbom2lLxYhTs/3vNwko/hBKxLSWvtW4In7hc9oFVRBg2ThIQ9wHKQnKU
	cAJPBvxMtl6LVSfEij94+l8tlVRhJZILs8P1XQ5aVFDX6l6eY6wAjDlG6sVOpk/h
	aKEFd6CGChKK8TqN+3JaUmCsKYWGA8Wk2KcRfv6Yyjw7HeKg0tGNWbeYh8UGMH+w
	kmgFlASoXWakyk6MIJ4ikXMNlpuSXAIld0PHfd8MD6jrd7/9mRGwNuBEnvCdfbg5
	Lju6tOnMr3Jevf8q89RRDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795424562; x=
	1795510962; bh=mSMHW4SmZ7OYr+vBAy7Z/uvi3mUnomgOnauIX7oa3es=; b=4
	MkzlCSfhwa1uB9QClYolpD7GussMQue68b+1FvyoDyyPXi9/WbU9HuErLnp94iPO
	u4KPSoAjzG0tDvI7I94wm9XXNG7R4pDciPQ4LDEnC0XQkCqlwUvDmqXIYyH+/1uN
	f/9AaHCsCkZruiPl1B4Lqs6Re5yFlad/H3i/A7orewTd/NtnYzcoptGIt3//YvGM
	KLNAVMONmpvZj2d7JiiOSpDy/r7Uw2zesJvGR/8J9kZBalmkorWDAEahH+QEu+Pd
	cJtnywJIx95u63j5bpBVRi0kWtLxwZ5SWoGL/VH6GmKORXR1DuTZZGszSP728g9z
	dZGB0x5Xfuw3JKx2StO3w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795424562; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm2:rsa-sha256:F7TDMW3MkNSY6bDkmp9ZnQtOg/gLyzJXSMwzXUlzz3YPAdK
	Da7YqjxqME2d7nD04Dfq99/1v/u07fbXcWc6iqk+KFRXNhYtrYDQXiqTcR9qda/m
	q41gifEoVfbbBOMmvaF8m2MzISD8/3+fGmpExiInnFonPBY04cd8++OtnY/fwzzG
	O7iAVNLL85uZ26oi8FEdW1rTBdB9ENcWWzgLfCM57jATUR64Z8c6vBH2PhvyHPxq
	v8eEuf7djDJDfd2MEsAmH8CtkpJf9mK73S6ZLMEeurqrzpBKhst6gerJ9qWNPP8h
	zl2NbHy7leZF2ubT0JT6FNhzIAHQwAxOz+i10ew==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tmvIL/cahxEGzpB6SnMH6xFzrQqc+W+Phe/Jt9mB6VQ=:7qk2guwvbFcpSziYnVgksq9uHBCrUvs17Vv8cIfjMUk=;
X-ME-Sender: <xms:LwEEa0LA4UbHIUGPBftaT23VpD8V3IZts_k4uNWFIonSwe3zzsCc3Q>
    <xme:LwEEa-_7QFXV03S3sNVlKMlduOEUiBTd-w-uMLwPmnIBH25QKgn5Pxu3QIwCi5Kyf
    xes0267U1_RXfz5yfOaOTSlhbOX9Ln18YmiWUZGVXiQIjXXz3nL_Ccf>
X-ME-Proxy-Cause: dmFkZTE9Y3bDyglrTkB27cTrD9anESzEMkv2GhLbk9MHV7VdB19BLh3aknxC8pv/OdT0OO
    13hymE4x0RdBa5v+V5RCo0yMGUpzt9F/qDF3NZJqw2MaE6jqmcQzg0eV2s7or+C1wsojf/
    sWfzHbrqscDbDJ1U55BDcx2bmx4OK6L4AMmt0jgq25z7ncnkK3LD+yhe6e5TgJEtoGfJYi
    08ByI6j5c3uoEM2+qTpW1HUZ3ZeshsCNXR6lFgU931+f6qEBHls58W0AEce3/fTcRIcZq6
    nqiyeVA29+RNZyMXzSEj8qgVYDLaXR8k3quLuO7bXzsEGfAbAZiIrR8e6lwzwwVL/pY/EC
    de8Rbs5qrJbdz7TUsow12VuQihh9nTJWMJNJfbIZfh7hl2PA8w7YD0+6/erN5zb+8oUCXj
    cTGEvacABfmp3siPPM07gIWsvoqX4IRo59tIlNJzrSIgqIp+pb+WDQf1jfU9Ovrjc5vSvn
    Vmwx/+ue74p+1REUDJ7tIQcLRZ0IxqPMNeEHVQqwh4icDMF/oS7gOYGuFkRrzmVbb7uGnb
    uqwG3JH0V2krDmrG3l3bRtjehOwgezpLwiMpuQS788fTUWXA0x7FO43B8rhqYFWvLRZIuF
    RJSk7c82AA/QpeA4rW9q5pKl2TdK6VOVJzxhbLYJbn5lfublEGxUH6MI02rA
X-ME-Proxy: <xmx:MAEEa2jekWHxIUONRMlo4W2Mg_O_99PuKGJfz1XlAUYAPzAwS1s2_g>
    <xmx:MAEEa09qBifBzy-WvlfkR2UfbrOhEZb1JMVOSHw61w5SEXFQsg_Hzw>
    <xmx:MAEEawZ_g9s9PsIxtitF7WeuUYtKbjb1ZVkZwcNjKqSENNZkQaOgZw>
    <xmx:MAEEaz3UZzFnvNskrMHZN30xmwBI6EkrpINJ3sHgQfJ4Yf0l6cA8rA>
    <xmx:MgEEa1jMiPI1Hk28KL-zwW5wVlzHsd5sOmBQyZPRoc4VsiE6YETYyj9O>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4AB3C32A0099; Mon, 23 Nov 2026 04:02:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: APJ_bPFyyT9Z
Date: Mon, 23 Nov 2026 10:02:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
Message-Id: <65dc77ce-395b-44b9-ad03-601d06c1040a@app.fastmail.com>
In-Reply-To: <20261123000645.2097033-1-vgupta@kernel.org>
References: <20261123000645.2097033-1-vgupta@kernel.org>
Subject: Re: [PATCH v2] ARC: stop linking libgcc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_010254_571900_AE97E648 
X-CRM114-Status: UNSURE (   9.58  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026, at 01:06, Vineet Gupta wrote:
> With the generic lib/ versions of the shift/multiply/compare helpers,
> the 32-bit divide routines (only needed without hardware div/rem) and
> clz/ctz all provided by the kernel, and the 64/64 divide and floating
> point routines gone, nothing in the kernel or modules resolves against
> libgcc any more.
>
> Drop it from the link so that any new dependency on it (e.g. a raw
> 64-bit division instead of div_u64()) shows up as a build failure
> rather than silently pulling in libgcc code.
>
> libgcc elision can break -Os builds as older gcc generate millicode
> thunks: disable them with -mno-millicode.
>
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>

Thanks, I have updated the asm-generic tree to use this version now.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
