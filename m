Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34087EEE25C
	for <linux-snps-arc@archiver.kernel.org>; Fri,  2 Jan 2026 10:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=S3qII/lj7D53wL5qDCFxDZM4OOO5zEEhdqlCqfrwdco=; b=VOxrmI/t78cVkobgBsElnYJVuL
	2jF3Gz8CU3V+JSIZsRvnig/KTK/WlM7FreQgyiy7t9UqBgr6lzFJUdZl2QOUoSuNPvdXj+Ggsucpi
	Ztdgq1Y8R6N/mDc4LcHpIs8D0IGdN1XTalJpWHHKqe2PkTBZCXryim44/BkAfYW5tvy+MS1nz13Bb
	rCeKjHm5qvIgBLCT/VwCjDt/r9pX14OZZwqAKJixlJ9YSgz7JYic3Jqw13Y/LOGNyj/miX59VdL1b
	GAEPB61bONiv4FGHVJKIEFY20mX7Uhx6KZ9ZyJ0NrC3mBUCAlfZTboeF/UlDWmNnxSSp1ppChKuNd
	MQwrXebA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcRp-000000084S7-3AfI;
	Fri, 02 Jan 2026 10:31:57 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcRm-000000084RR-3X5O;
	Fri, 02 Jan 2026 10:31:56 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id DDCD9EC009B;
	Fri,  2 Jan 2026 05:31:52 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 02 Jan 2026 05:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767349912;
	 x=1767436312; bh=cUMtD88AdGpX8s4OOc8iMm1yt6OaFYCq7BaaMzDEg90=; b=
	jGFXaUJbwqcPteJhWuVBhXcv8RAwsMWr32964lXm1uY1QLhYOA8cWftHHKf43yhj
	yXc+vaWfGTVRNpqbQpdBle65CXYc+Rtt6sJG5rYKxulQ82gWDsMPHwquMWO7my5h
	uC7IL9D/BCilZov4t+klsW8WXI+rZbyhQVrvWiYStw7Tgdl2mOfl/ajmCe50kPxm
	msChMrujypgo4hkHo1hkK4dvNVp0miW+2hJH4PKPGgvj59TiAq2Lv9hnkce9mkBh
	2RV2yPiHOMhWZgEdC/Izjz+qaZQDzfgNYCZIRekQ/q+jf6XhWqMYoOI5QYf+0+l0
	naxmV4DL9+zUlMZeBOZH+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767349912; x=
	1767436312; bh=cUMtD88AdGpX8s4OOc8iMm1yt6OaFYCq7BaaMzDEg90=; b=J
	RHc/9SWZSN5rsHd9oSi0N7Q8f981/MO8Y9eTxO552Y1Sf+svMNaqRDmAJzDYjKfE
	aiudOE4QIiCaKNzasBQ5JD+PrcdoY4m6kUuh5xAbJENz4qBtTh3zeFTU/HuGdSS/
	al7DWk101ftf5p9siYkiBBzFVP8RfKCI3oFnFn285u61gHwSGNh5pckSxFgawUVg
	blEsg5CaoVO9UMQzTDDKG0Wh/WizA3lpCw0ulPjM4yyZmR7oYcNJRnqc7oyxq1ll
	JNlo+X/zujYfhm5V/ZYd0cJNOpiVi0UzxL5FPf24a/TEGySsizfIZkawQlMWbV8J
	WRSMp/a2PoB2rv9mR2BXg==
X-ME-Sender: <xms:mJ5XafaL0-7xllO4Nl9Oa7lV-NdvZHadLwpMg8cZm1EuY48JA4oCuQ>
    <xme:mJ5XaZNvKPZYVXFhOhErKhPVUzsP4ccEUkMMjp9xuVbbLxEaga7JqRRAqtqdMCPHE
    KxIqPUiuF1zcdB48hZKT1uDhCRF-MKCc-yYjXEQ4OTfr7SEdewAWgFM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekkeegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtoheplhhinhhugiesrg
    hrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopeguihhnghhuhigvnheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepvhhguhhpthgrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehthhhomhgrshdrfigvihhsshhstghhuhhhse
    hlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhi
    nhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnh
    gvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:mJ5XaRxLBnij4XmWE4Jry3SpX43BpY9ulvxMtOAzbaIYjrfDNs2jOw>
    <xmx:mJ5XaQ1iF-ZxJXtDqyE_siS19FPwJqTe54EZcJUDqVjSw7hFHXxAEQ>
    <xmx:mJ5XafoAhIYqiN8YjcrQLwwJ2-JRi6ywCpN-E-vQ0F7SevBEavykJQ>
    <xmx:mJ5XaWCGbdLwfRZN9hCFfTxoJ2vlSj4fenrudfav8i27qGkn5mgEpg>
    <xmx:mJ5XaUfE3WiNbOhqCTf2y1uUzGKe1M0j8S9tOfoAI6ho15TaPhVFp7BW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0607E700065; Fri,  2 Jan 2026 05:31:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AbWOAV9uh8L3
Date: Fri, 02 Jan 2026 11:31:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>, "Dinh Nguyen" <dinguyen@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-Id: <0ae2688a-5a22-405b-adaf-9b5ad712b245@app.fastmail.com>
In-Reply-To: <20260102103913-0420048c-d2f3-431b-8bbb-5962a1553aab@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
 <20251230-headers_install-config-leak-v1-1-efba5c58073d@linutronix.de>
 <9ecebf46-c230-4074-9001-7ba9d65634f1@app.fastmail.com>
 <20260102085226-c6463fff-042d-4654-8721-27e995f06c7c@linutronix.de>
 <20260102103913-0420048c-d2f3-431b-8bbb-5962a1553aab@linutronix.de>
Subject: Re: [PATCH 1/5] ARC: uapi: Stop leaking CONFIG_ARC_HAS_SWAPE reference to
 userspace
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_023155_444017_B9317FBE 
X-CRM114-Status: GOOD (  21.53  )
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

T24gRnJpLCBKYW4gMiwgMjAyNiwgYXQgMTA6NDAsIFRob21hcyBXZWnDn3NjaHVoIHdyb3RlOgo+
IE9uIEZyaSwgSmFuIDAyLCAyMDI2IGF0IDA4OjU1OjEwQU0gKzAxMDAsIFRob21hcyBXZWnDn3Nj
aHVoIHdyb3RlOgo+PiBPbiBUdWUsIERlYyAzMCwgMjAyNSBhdCAxMDoyMzowOFBNICswMTAwLCBB
cm5kIEJlcmdtYW5uIHdyb3RlOgo+PiA+IE9uIFR1ZSwgRGVjIDMwLCAyMDI1LCBhdCAwODoxMCwg
VGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cj4+ID4gPiBVQVBJIGhlYWRlcnMgYXJlIG5vdCBzdXBw
b3NlZCB0byBsZWFrIHJlZmVyZW5jZXMgdG8ga2NvbmZpZyBzeW1ib2xzLgo+PiA+ID4gVGhlc2Ug
d29uJ3QgYmUgc2V0IHdoZW4gYnVpbGRpbmcgdXNlcnNwYWNlLiBIaWRlIHRoZSBrY29uZmlnIHJl
ZmVyZW5jZQo+PiA+ID4gYmVoaW5kICdpZiBkZWZpbmVkKF9fS0VSTkVMX18pJywgc28gaXQgd2ls
bCBiZSBzdHJpcHBlZCBieQo+PiA+ID4gaGVhZGVyc19pbnN0YWxsLnNoLiBUaGUgcmVzdWx0IGZv
ciB1c2Vyc3BhY2Ugd2lsbCBiZSB0aGUgc2FtZSwgYnV0IHRoZQo+PiA+ID4gZXhjZXB0aW9uIGlu
IGhlYWRlcnNfaW5zdGFsbC5zaCBjYW4gYWxzbyBiZSByZW1vdmVkLgo+PiA+ID4KPj4gPiA+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJv
bml4LmRlPgo+PiA+IAo+PiA+IEFja2VkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRl
Pgo+PiA+IAo+PiA+IFNhbWUgYXMgZm9yIHRoZSBuaW9zMiB2ZXJzaW9uLCBJIHRoaW5rIHRoZSBu
aWNlciBzb2x1dGlvbiB3b3VsZAo+PiA+IGJlIHRvIHVzZSB0aGUgYXNtLWdlbmVyaWMgaGVhZGVy
IGZvciB1YXBpIGFuZCBtb3ZlIHRoaXMgb25lCj4+ID4gdG8gYXJjaC9hcmMvaW5jbHVkZS9hc20v
c3dhYi5oIGZvciBrZXJuZWwtaW50ZXJuYWwgdXNlLgo+PiAKPj4gQWNrLiAoLi4uKQo+Cj4gVGhp
cyBkb2Vzbid0IHNlZW0gdG8gYmUgdHJ1ZS4gQVJDIGRvZXMgaGF2ZSBhIGN1c3RvbSBDIGltcGxl
bWVudGF0aW9uIHdoaWNoCj4gYWNjb3JkaW5nIHRvIGl0cyBjb21tZW50IGlzIHN1cHBvc2VkIHRv
IGJlIG1vcmUgZWZmaWNpZW50IHRoYW4gdGhlIGdlbmVyaWMgb25lLgo+IFNvIEknZCBsaWtlIHRv
IGtlZXAgdGhpcyBhcy1pcy4KClJpZ2h0LCB0aG91Z2ggSSBzZWUgdGhhdCBzaW5jZSA3NjdhNjk3
ZTc1NzYgKCJBUkM6IHJldGlyZSBBUkM3NTAKc3VwcG9ydCIpLCBhbGwgc3VwcG9ydGVkIENQVXMg
ZG8gaGF2ZSB0aGUgJ3N3YXBlJyBpbnN0cnVjdGlvbiwKc28gSSBzdXBwb3NlIHdlIGNvdWxkIGp1
c3QgYXMgd2VsbCByZW1vdmUgdGhlIENPTkZJR19BUkNfSEFTX1NXQVBFCnN5bWJvbCBhbmQganVz
dCBrZWVwIHRoZSBpbmxpbmUgYXNtIHZlcnNpb24uCgpJIGFsc28gY2hlY2tlZCB0aGF0IGZvciAt
bWNwdT1hcmNocywgdGhlIGNvbXBpbGVyIHVzZXMgc3dhcGUKaW4gX19idWlsdGluX2Jzd2FwMzIo
KSwgYnV0IGl0IHNlZW1zIHRoYXQgdGhlcmUgaXMgbm8gbWNwdT1hcmM3NzAKb3B0aW9uLCBhbmQg
YnVpbGRpbmcgZm9yIGFyYzcwMCBpbnN0ZWFkIGdldHMgdXMgdGhlIGV4dGVybmFsCmxpYnJhcnkg
Y2FsbCwgd2hpY2ggaXMgbGlrZWx5IHdvcnNlIHRoYW4gc3dhcGUuCgogICAgQXJuZAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMg
bWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
