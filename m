Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A3CC77B70
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Apr 2023 09:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=99cXOwxckk+VyhrsDqq+daiudNm416BttvT5rGJipI0=; b=jonJtvWgAXoy0l
	M155NNKvNZoo2dIVNL4ZUOQkG93XCF921Xl7TlRaSyi8CcuR7DsMJi67oYfk9LOFKhfgG7//l22s+
	WJ0DhkVDPEQ9FS4Ye9GvJ00Up4BZ+fO0MDPP+1I/RSkeowUxwEcxHvqilb5vTq6tExf3sQKatCzSf
	WbLORVq0BfNkvlCrDdEm62LgICBpcpyERO1XNVaPn0PqsW9FSRs1opgckjJtpp8Qowde1w3bsbbyG
	p1KmncnXlLkyV1mkXIGDLrWj/PFVgSr7HnjwBBcJY5WSCmT5RCfaxQaK4sLfP+9iSXewX4r7v1vxm
	/8qwWgm2CKKShBT31KoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poL4g-00FW5w-0w;
	Mon, 17 Apr 2023 09:23:02 +0000
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poL4X-00FW0a-2u;
	Mon, 17 Apr 2023 09:22:58 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id DD2C02B066BA;
	Mon, 17 Apr 2023 05:22:47 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 17 Apr 2023 05:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1681723367; x=1681730567; bh=peYP/lOIqmvTTJ2GJZFK05PdIeVxfQrMTMT
	dWlxN2bY=; b=hoxslnOKq5L0fgq1KZ5uwFxkfCsDUbQoEitttD9Gb157/4VvDaL
	fzRTYgwNrKhMTGBEWYk5kV4pCoKxj3IQV0FpUtGeddLg5GfVlMhZex8QF6mhL8p9
	gvwX4MSUzxesv1YcnaqKaa4Hf8aEonHOEB+LqYDIenoy4k9B5AvOOz7WXYv6rPww
	vauHxzq0EC93J9INj8HpYFP0uokUJZlvJ0DGwXpWQ8LUcqRJMmLECR08O/Gg7C4C
	FExoluX3ejusbKwfN3AFnDxBNc0Jh1L5n5E2k8MJ529jR2BSvuckTFMjwePw4/jA
	IVxKZIBctylYcZmrJ3YTpI6yusKyhHnhjmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1681723367; x=1681730567; bh=peYP/lOIqmvTTJ2GJZFK05PdIeVxfQrMTMT
	dWlxN2bY=; b=MR4yxKuz3/tjr23pAzsFitwD0Txq7SZ+LasC5Fyh1rdL9W+5uLQ
	QWuTkcsnaN+XbFlYxewK49c7zL/ltjC0cAxyGzvY+pAqila9tzloSXls1fSGTLU8
	83j+ql9LP2Am/jKxSL+2eFTD9s2a+pAHNF1s4l+85O8VFC4gAEQAX/IiexVaT7mA
	1njCOrvD++JH4RDb7rqDNfo30GjQVpEJWnie2UNVdXN3+HoTO7VAHqni1UoK4zJb
	K0nmV8AH3mMhRqTjxdJcDOoA4dxU/4N4+juQYM/HVijErDhMcN+7kkXCY9vJtEKX
	A6hZ5WwaK7trmU2l173N30Rm9x+GYS13Hyg==
X-ME-Sender: <xms:5g89ZGh1XGEKu3GOwuyxUAI_aRj0-gXb1yU9cH41yOyGtrZXXEBRxw>
    <xme:5g89ZHCJrzk8kcvbfI9uoi9xOXxIpgIcnUMY2tPn_xA8atud9UMgflJi8xJj_xxVr
    3CIR7jk9VrljLNWmYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeliedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:5g89ZOF82A9szmMdiIKfUdndIY5Y_J2WWepzSI164UFVULZ600rDfg>
    <xmx:5g89ZPS9rsGZ3-6dQW4K4hejhxqnpa-f-mX9DnhlkCPRmeMFlap6YA>
    <xmx:5g89ZDzdQ2ec3Pn4h3UEvgarbJnSwOf3ZSGbcWd6YhZnAMBHYJ805Q>
    <xmx:5w89ZEqvqQ-8qIHbFuXLaLZUzpDWtqOdQ0aVq4skLKD0cgTZu8vkwIppGeY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2AD08B60086; Mon, 17 Apr 2023 05:22:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <55abd7af-acb8-47ce-89db-1722bcf0cb9c@app.fastmail.com>
In-Reply-To: <2b4f75b8-aa83-8e41-7c99-7c8d573c0f31@suse.de>
References: <20230406143019.6709-1-tzimmermann@suse.de>
 <20230406143019.6709-2-tzimmermann@suse.de>
 <CAMuHMdUfViWzPbB+GcGUwxmGNxAohfq71Jed3DzS=Cb+gBzotg@mail.gmail.com>
 <2b4f75b8-aa83-8e41-7c99-7c8d573c0f31@suse.de>
Date: Mon, 17 Apr 2023 11:22:24 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Daniel Vetter" <daniel.vetter@ffwll.ch>, "Helge Deller" <deller@gmx.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 01/19] fbdev: Prepare generic architecture helpers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_022254_340303_86934E3B 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBcHIgMTcsIDIwMjMsIGF0IDExOjAzLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToK
PiBBbSAxMS4wNC4yMyB1bSAxMDowOCBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZlbjoKPj4gT24g
VGh1LCBBcHIgNiwgMjAyMyBhdCA0OjMw4oCvUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+IHdyb3RlOgoKPj4+ICsjaWZuZGVmIGZiX3BncHJvdGVjdAo+Pj4gKyNkZWZp
bmUgZmJfcGdwcm90ZWN0IGZiX3BncHJvdGVjdAo+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBmYl9w
Z3Byb3RlY3Qoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG9mZikKPj4g
Cj4+IERvZXMgdGhpcyBhZmZlY3QgYW55IG5vTU1VIHBsYXRmb3JtcyB0aGF0IHJlbGllZCBvbiBm
Yl9wZ3Byb3RlY3QoKQo+PiBkb2luZyBub3RoaW5nIGJlZm9yZT8KPj4gUGVyaGFwcyB0aGUgYm9k
eSBiZWxvdyBzaG91bGQgYmUgcHJvdGVjdGVkIGJ5ICIjaWZkZWYgQ09ORklHX01NVSI/Cj4KPiBJ
IGNhbm5vdCBjb25jbHVzaXZlbHkgYW5zd2VyIHRoaXMgcXVlc3Rpb24sIGJ1dCBJIGRpZCBzb21l
IGdyZXAnaW5nIAo+ICgnZ2l0IGdyZXAgbmRlZiB8IGdyZXAgQ09ORklHX01NVScpOgo+Cj4gT25s
eSB0aGUgYXJjaGl0ZWN0dXJlcyBpbiB0aGlzIHBhdGNoc2V0IHByb3ZpZGUgPGFzbS9mYi5oPiBi
dXQgbm90aGluZyAKPiBhbnl3aGVyZSB1c2VzIDxhc20tZ2VuZXJpYy9mYi5oPiB5ZXQuIEFuZCBv
ZiB0aG9zZSBhcmNoaXRlY3R1cmVzLCBvbmx5IAo+IGFybSBhbmQgbTY4ayBoYXZlICFDT05GSUdf
TU1VIGNhc2VzLiBUaG9zZSBhcmUgaGFuZGxlZCBpbiB0aGUgcnNwIAo+IHBhdGNoZXMuIEkgdGhp
bmsgd2UncmUgZ29vZC4KCkFncmVlZC4gVGhlIGdlbmVyaWMgdmVyc2lvbiBpcyBqdXN0IGEgbW9y
ZSBlbGFib3JhdGUgd2F5IHRvIGRvCm5vdGhpbmcgaGVyZSwgYXMgdGhlIAoKICAgICB2bWEtPnZt
X3BhZ2VfcHJvdCA9IHBncHJvdF93cml0ZWNvbWJpbmUodm1hLT52bV9wYWdlX3Byb3QpOwoKbGlu
ZSBvbiBub21tdSBqdXN0IHR1cm5zIGludG8gYSBzZWxmLWFzc2lnbm1lbnQgb2YgdGhlIHNhbWUg
bWVtYmVyCnRoYXQgd2FzIHNldCB0aGUgbGluZSBiZWZvcmUuCgogICAgIEFybmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1h
aWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
