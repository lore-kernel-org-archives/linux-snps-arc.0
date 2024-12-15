Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75858E7716A
	for <linux-snps-arc@archiver.kernel.org>; Sun, 15 Dec 2024 20:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ai9zswYDlUEs2dDbWRN5sssqWS17DTbPT+xSbWvVr2E=; b=wYiGElxQgk5Gr6
	yVmc2mFBHaYOJeooqRIkFtOIkx0KaNw3HwA0cnCB6fDKfvUCr+CfwnEjkNYtLxkyfWS/mxj74IgYL
	vqaFHNcFpaaOcl3m+6z8OEHwMWYImqFMeZ7JyCy9jScnE4KyavR07KprP45kqeHgl8W+Pd7r1Bzq5
	QG1yGnMu4SeCwLOC79TCd8QpJSv1l0aNWc3QI+3lsRjunHaaW0ahSrzoqtgSX3jY13ux8bhPda3zh
	QuzepyZquF3R7bUnF+O1fqry54JUVspxetssXGNPazqB+EJcDCwLg5miOl0yfU8v01PsaVjyar8Jm
	HYWWCF0uQ4+0atkdLXpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMvYu-00000008RqH-310W;
	Sun, 15 Dec 2024 20:50:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMvYs-00000008Rpb-3XqF
	for linux-snps-arc@lists.infradead.org;
	Sun, 15 Dec 2024 20:49:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 21D305C5C3E;
	Sun, 15 Dec 2024 20:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63163C4CECE;
	Sun, 15 Dec 2024 20:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734295796;
	bh=cPKzzqKkHLMu415YDondciNGZujnY7eo/7uNqZFN2Og=;
	h=Date:From:To:Cc:Subject:From;
	b=cbOV9EL5jLa3n5F3LUQJZnYvdCQSmsfzn95xNy6BNjZNdZXvGetfVl2ynCDdhpcc1
	 PLE7laxf1z/V62x8Fhita/SW9s9DdWhfa+d+RTXixMWfuhuI27lh6mGhqY2efYf3AQ
	 zv0Gfe2ohqvHDREVuXGC1QMkYZiKIbILT/4POarVYO8bFAcx8PV6bflRKzVKaNLXCI
	 7cyixIJf3FK+kyhuf79oydNht3asvOMk03EbTBsufnE+YfUhoNP4ree1f95MkzwDeu
	 fdQqzubPzTo0OuVeXoLFmwFoLsq+GFAyS9jj/a7JHEUPG6Q4FJzGtu+GsWBZ51h4yf
	 MdwBYuyMTuvPQ==
Message-ID: <c7e0d492-c7a2-4266-904c-9b247a41fa20@kernel.org>
Date: Sun, 15 Dec 2024 12:49:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 =?UTF-8?Q?Sz=C5=91ke_Benjamin?= <egyszeregy@freemail.hu>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 Leon Romanovsky <leon@kernel.org>, lukas Bulwahn <lukas.bulwahn@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [GIT PULL] ARC fixes for 6.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_124958_950599_5F9E1D4B 
X-CRM114-Status: UNSURE (   6.34  )
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

SGkgTGludXMsCgpBIGxpdHRsZSBwaWxlIG9mIGxvbmcgcGVuZGluZyBmaXhlcyBmb3IgQVJDLgpQ
bGVhc2UgcHVsbCAhIEhhcHB5IEhvbGlkYXlzLgoKVGh4LAotVmluZWV0Ci0tLS0tLS0tLS0tLS0t
LS0tLS0tLT4KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBmYWMwNGVmYzVjNzkz
ZGNjYmQwN2UyZDU5YWY5ZjkwYjdmYzBkY2E0OgoKwqAgTGludXggNi4xMy1yYzIgKDIwMjQtMTIt
MDggMTQ6MDM6MzkgLTA4MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoKCsKgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC92Z3Vw
dGEvYXJjLmdpdC8gdGFncy9hcmMtNi4xMy1maXhlcwoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIDgyNDkyN2U4ODQ1NjMzMWM3YTk5OWZkZjVkOWQyNzkyM2I2MTk1OTA6CgrCoCBBUkM6
IGJ1aWxkOiBUcnkgdG8gZ3Vlc3MgR0NDIHZhcmlhbnQgb2YgY3Jvc3MgY29tcGlsZXIgKDIwMjQt
MTItMTMgMTQ6Mzk6MjQgLTA4MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkFSQyBmaXhlcyBmb3IgNi4xMy1yMzIgb3Ig
cmM0CgrCoC0gU3VuZHJ5IGJ1aWxkIGFuZCBtaXNjbGwgZml4ZXMKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQmVuamFtaW4g
U3rFkWtlICgxKToKwqDCoMKgwqDCoCBhcmM6IHJlbmFtZSBhdXguaCB0byBhcmNfYXV4LmgKCkhh
cmRldnNpbmggUGFsYW5peWEgKDEpOgrCoMKgwqDCoMKgIEFSQzogYnBmOiBDb3JyZWN0IGNvbmRp
dGlvbmFsIGNoZWNrIGluICdjaGVja19qbXBfMzInCgpMZW9uIFJvbWFub3Zza3kgKDEpOgrCoMKg
wqDCoMKgIEFSQzogYnVpbGQ6IFRyeSB0byBndWVzcyBHQ0MgdmFyaWFudCBvZiBjcm9zcyBjb21w
aWxlcgoKTHVrYXMgQnVsd2FobiAoMSk6CsKgwqDCoMKgwqAgQVJDOiBmaXggcmVmZXJlbmNlIG9m
IGRlcGVuZGVuY3kgZm9yIFBBRTQwIGNvbmZpZwoKUGF1bCBFLiBNY0tlbm5leSAoMSk6CsKgwqDC
oMKgwqAgQVJDOiBidWlsZDogVXNlIF9fZm9yY2UgdG8gc3VwcHJlc3MgcGVyLUNQVSBjbXB4Y2hn
IHdhcm5pbmdzCgpVd2UgS2xlaW5lLUvDtm5pZyAoMSk6CsKgwqDCoMKgwqAgQVJDOiBkdHM6IFJl
cGxhY2UgZGVwcmVjYXRlZCBzbnBzLG5yLWdwaW9zIHByb3BlcnR5IGZvcgpzbnBzLGR3LWFwYi1n
cGlvLXBvcnQgZGV2aWNlcwoKVmluZWV0IEd1cHRhICgxKToKwqDCoMKgwqDCoCBBUkM6IGJ1aWxk
OiBkaXNhbGxvdyBpbnZhbGlkIFBBRTQwICsgNEsgcGFnZSBjb25maWcKCsKgYXJjaC9hcmMvS2Nv
bmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKystLQrC
oGFyY2gvYXJjL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDIgKy0KwqBhcmNoL2FyYy9ib290L2R0cy9heGMwMDEuZHRzacKgwqDCoMKgwqDCoMKgIHzC
oCAyICstCsKgYXJjaC9hcmMvYm9vdC9kdHMvYXhjMDAzLmR0c2nCoMKgwqDCoMKgwqDCoCB8wqAg
MiArLQrCoGFyY2gvYXJjL2Jvb3QvZHRzL2F4YzAwM19pZHUuZHRzacKgwqDCoCB8wqAgMiArLQrC
oGFyY2gvYXJjL2Jvb3QvZHRzL2F4czEweF9tYi5kdHNpwqDCoMKgwqAgfCAxMiArKysrKystLS0t
LS0KwqBhcmNoL2FyYy9ib290L2R0cy9oc2RrLmR0c8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAy
ICstCsKgYXJjaC9hcmMvaW5jbHVkZS9hc20vYXJjcmVncy5owqDCoMKgwqDCoMKgIHzCoCAyICst
CsKgYXJjaC9hcmMvaW5jbHVkZS9hc20vY21weGNoZy5owqDCoMKgwqDCoMKgIHzCoCAyICstCsKg
YXJjaC9hcmMvaW5jbHVkZS9hc20vbW11LWFyY3YyLmjCoMKgwqDCoCB8wqAgMiArLQrCoGFyY2gv
YXJjL25ldC9icGZfaml0X2FyY3YyLmPCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCsKgaW5jbHVk
ZS9zb2MvYXJjL3thdXguaCA9PiBhcmNfYXV4Lmh9IHzCoCAwCsKgaW5jbHVkZS9zb2MvYXJjL21j
aXAuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KwqBpbmNsdWRlL3NvYy9h
cmMvdGltZXJzLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KwqAxNCBmaWxlcyBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKwqByZW5hbWUgaW5jbHVk
ZS9zb2MvYXJjL3thdXguaCA9PiBhcmNfYXV4Lmh9ICgxMDAlKQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0
CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
