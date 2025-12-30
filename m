Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC62BEE01F6
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Dec 2025 21:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qmK/f/qCj9vxOim1VjcSISebWW3VQc3+ci5vFRJdqbI=; b=rHF9T5OrqAzmq0dm+91cAhTEG/
	KLIkV2JpdNaQi1HAkpXNLfo/+CNnZqKy1x2mulI9zDLYpWAJIiYxiRa43OlpL/XBgYxzT8oYUpVHb
	+8FVk0mvSzmuwb9n7EAo0Yd30CsyBH0OdA4nlOed45umjo0iQDQuVpX7uCyAPSnVOY0/2i09JKb4w
	nzUeZH558F72abzbsS81k32OdGoMofAFC93V5R5v+nu42zYpsrEzxmDDUbSLPHwNEDdjomz+Kqd5v
	x+o+M7urFFB8JoB1rxglEp2mO/wUxr+g4tgHklW9rbVRnA7CVAPnEEX5fQ3lY2Q56mDiWHdN3wyvP
	3VVNWdeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vah88-00000005Izp-1WR3;
	Tue, 30 Dec 2025 21:19:48 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vah85-00000005IzL-0Zig;
	Tue, 30 Dec 2025 21:19:46 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 18B4B140010B;
	Tue, 30 Dec 2025 16:19:44 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 30 Dec 2025 16:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767129584;
	 x=1767215984; bh=gaRqv7k7VA61kOfmLtimV5rGgCGFCZ9YKiGuBGbb1EI=; b=
	rssManEhMuouAJrUcFMK+d3yZigXJ8ZX5wfE7aVfxVK6exde9GYrwv76yH3RDFOY
	n+WuGMXpsVM0DAlyDR+rm0Z9U6msE/jZlGX6HmtEu01mnvYNqo5SHZenCsPwbOtA
	7zBLr7qL+osA4D3A5Q/IPjO51Y8YRnyT5UoPHL79scullTrcMr4EH7H3hXRz0dMl
	Mif1PCkeJKrfK8vQ9y73jzUz3kZ8NM7JRim3R1Z3YdYKqHlEZtGQT3DncXbxRiF8
	wqktnyPCN3ELrQQLL1m6GgaviWDjcZpZeX1zX5VCYRBDV/lJ/FK/YptydrIOvqj/
	FngxD3fMXbctQt7Xv1+J7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767129584; x=
	1767215984; bh=gaRqv7k7VA61kOfmLtimV5rGgCGFCZ9YKiGuBGbb1EI=; b=g
	en7v+wnekIyiUPLxQVI4zShOneTJrXWjRjnMZ7iYqo6pD7WGat5sNhmEOdXpGvdu
	f41RW6XSWON2cAjjdlmOhF9eiMF0GOWk09R6UOEusd9vDslYE2l30ZZZcxjFe6Bl
	v2gzWP+e5i8RNKBtF3LVRzr8XbMPJ7O+w5/MGdxYto1ynKDDcN34H42/hzlgYpzq
	w7ax8mH24AVKFjTsxFtcKMIr1OMxZZyhiKTTa6qFsG/CYhS2kqna3QO9t0BvPccD
	1/QK/TlVMaiXmZTAMdzouourQmbjyiwlcabmFHy1eFL5cvCE2UGHudCOSfxc+pxl
	Ob0cuGMdr7O9uecLAy90Q==
X-ME-Sender: <xms:70FUaYJuXBybU4ESG4j6EgnOJxKPZ8J1bEm2xxU8ZEaTV9EUc5wdvg>
    <xme:70FUaS-tCpY8sbvbz9hVuJxJA_xOXWqLdcunuS7ipGmKNMH0jpXOSR90-5yTNpZrD
    1727Q0LVdGjyhmY7Kzt90BKWjwZ6lHcTFgbbSsRxHyjDMQxP3BcUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekuddtlecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:70FUaQgP-JMzu_xmvfxwJpTBVdBW1OiqpQkKnqAI1zHyo5s1wAmdiw>
    <xmx:70FUaYnVnUcRsQ__xeAnKBChr80fdTccxjv8h4s-wkWn-ijkBk7iYA>
    <xmx:70FUacaU1NZXNxkZoF2lEehHMGSLdYefbsXapL-GuidnjcW_DdUj5Q>
    <xmx:70FUaTy8lZETqHSujSoS5nKa3fWiEYKATp3oxpcnVQjLiPIcY3Kp6g>
    <xmx:8EFUafMvYwwHj5f5bGm86TQ3E-FZXMyUWVrWK8QSm5FO1oqDZe6qGXmC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D56E2700069; Tue, 30 Dec 2025 16:19:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AGeayQqQY9QV
Date: Tue, 30 Dec 2025 22:19:22 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Vineet Gupta" <vgupta@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <93c55086-931a-4282-a94c-de4954047fa9@app.fastmail.com>
In-Reply-To: <20251230-headers_install-config-leak-v1-3-efba5c58073d@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
 <20251230-headers_install-config-leak-v1-3-efba5c58073d@linutronix.de>
Subject: Re: [PATCH 3/5] nios2: uapi: Stop leaking CONFIG_NIOS2_CI_SWAB_{NO,SUPPORT}
 references to userspace
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_131945_245234_E4A76C75 
X-CRM114-Status: GOOD (  17.43  )
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

T24gVHVlLCBEZWMgMzAsIDIwMjUsIGF0IDA4OjEwLCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToK
PiBVQVBJIGhlYWRlcnMgYXJlIG5vdCBzdXBwb3NlZCB0byBsZWFrIHJlZmVyZW5jZXMgdG8ga2Nv
bmZpZyBzeW1ib2xzLgo+IFRoZXNlIHdvbid0IGJlIHNldCB3aGVuIGJ1aWxkaW5nIHVzZXJzcGFj
ZS4gSGlkZSB0aGUga2NvbmZpZyByZWZlcmVuY2UKPiBiZWhpbmQgJ2lmZGVmIF9fS0VSTkVMX18n
LCBzbyBpdCB3aWxsIGJlIHN0cmlwcGVkIGJ5Cj4gaGVhZGVyc19pbnN0YWxsLnNoLiBUaGUgcmVz
dWx0IGZvciB1c2Vyc3BhY2Ugd2lsbCBiZSB0aGUgc2FtZSwgYnV0IHRoZQo+IGV4Y2VwdGlvbnMg
aW4gaGVhZGVyc19pbnN0YWxsLnNoIGNhbiBhbHNvIGJlIHJlbW92ZWQuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25peC5kZT4K
CkFja2VkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKPiAtLS0KPiAgYXJjaC9u
aW9zMi9pbmNsdWRlL3VhcGkvYXNtL3N3YWIuaCB8IDIgKysKPiAgc2NyaXB0cy9oZWFkZXJzX2lu
c3RhbGwuc2ggICAgICAgICB8IDIgLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9uaW9zMi9pbmNsdWRlL3Vh
cGkvYXNtL3N3YWIuaCAKPiBiL2FyY2gvbmlvczIvaW5jbHVkZS91YXBpL2FzbS9zd2FiLmgKPiBp
bmRleCA5NzUwNTQ3YTVmODIuLmJiZmE5YmQxMGIyZiAxMDA2NDQKPiAtLS0gYS9hcmNoL25pb3My
L2luY2x1ZGUvdWFwaS9hc20vc3dhYi5oCj4gKysrIGIvYXJjaC9uaW9zMi9pbmNsdWRlL3VhcGkv
YXNtL3N3YWIuaAo+IEBAIC0xNCw2ICsxNCw3IEBACj4gICNpbmNsdWRlIDxsaW51eC90eXBlcy5o
Pgo+ICAjaW5jbHVkZSA8YXNtLWdlbmVyaWMvc3dhYi5oPgo+IAo+ICsjaWZkZWYgX19LRVJORUxf
Xwo+ICAjaWZkZWYgQ09ORklHX05JT1MyX0NJX1NXQUJfU1VQUE9SVAo+ICAjaWZkZWYgX19HTlVD
X18KPiAKCkknbSBmYWlybHkgc3VyZSB0aGlzIGFwcHJvYWNoIGlzIGNvcnJlY3QsIGJ1dCBJIG5v
dGljZWQKdGhhdCB0aGlzIG1ha2VzIGFyY2gvbmlvczIvaW5jbHVkZS91YXBpL2FzbS9zd2FiLmgg
ZW1wdHkKaW4gdXNlcnNwYWNlLCBzbyB5b3UgY291bGQganVzdCBtb3ZlIHRoZSBjdXJyZW50IGZp
bGUKdG8gYXJjaC9uaW9zMi9pbmNsdWRlL2FzbS9zd2FiLmggaW5zdGVhZCBhbmQgZmFsbCBiYWNr
IHRvCnRoZSBhc20tZ2VuZXJpYyBoZWFkZXIgZm9yIHVhcGkuCgogICAgIEFybmQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1h
aWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
