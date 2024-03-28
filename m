Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A87CD11DF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 Mar 2024 20:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1byuDNJam7DudHVPM+jgzPeccUD7jIixCNCdfeCFT94=; b=leSWnqg+cpciU3
	H5vpsZ0oW4FCRrdDmT+HPdGCJxLrScitm3x4TQlIt7gz0VAy0L1+lViBPrBC+b6xImiHov3/t8VpC
	4MfRJWWfN/3D1gy7k9PNLN/0Wudf8XCtCwHB+XAZ0mRWJD5C6aaKhRXJBRWPG9lRTMN5rbKiLOEfI
	zpgaQF+8p3vVt5AjtapFpJRBYj4Dv6UaXP+d691r6AbPA+rILb0jprtBD+u1TlX4GWgRahtcxi3tt
	ISD+9reZQuZpvbtoKMKfN+QSTiIobwgjzLGzLgcuB0VjAtCcDmbEgrZIa5CNY2hfQoWMzqL150K7X
	oRKwbvE41zuthvhjWAuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpwG8-0000000FZND-410u;
	Thu, 28 Mar 2024 20:22:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpwG6-0000000FZMr-3xQr
	for linux-snps-arc@bombadil.infradead.org;
	Thu, 28 Mar 2024 20:21:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uGou/tFvyN4pFQ6vJGKJxsU6sAOu0lszkUmdAOhpj+I=; b=mEuzlPyFUTKDCl87jShIw7M/8n
	6d63ozGtv/c28JuLRmMRE5LnWPUKELbJVKgXuq/sfelhmw81DSERZzTf7AMPUBPtYudbR3XCFnJ/T
	GmoU+n58VkGW0Oruv0O3WYqUGQd0tzlaQ8Gep7vsXu4o0IuIp5mIdWcSfCC0dIeYiOsJfdAELja2I
	JMYMTsQabrSIxKm/ukEXm3OGtSAaTWt4ZwFsMw4W+VvXwxkKjnZoQQzPlABZuJDtD2H7AwXPgIbyn
	go4NDWl4LhkkJxjK0qMo7QvIZEJPVZdQOKiCAcvBqgRzNXK1BCcun3q6r01vLfgLMZYI8fWWFW9R8
	H6IUAEsg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpwG0-000000019r4-0btG
	for linux-snps-arc@lists.infradead.org;
	Thu, 28 Mar 2024 20:21:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3DAC660B76;
	Thu, 28 Mar 2024 20:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD34FC433C7;
	Thu, 28 Mar 2024 20:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711657307;
	bh=uGou/tFvyN4pFQ6vJGKJxsU6sAOu0lszkUmdAOhpj+I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XdAtzNEKalcfZP3Gd1CzbOvkdBkcD5xVZIGSVIVC+sdz348m16TaFgWhOtEWxgVeX
	 nIyAoI/zBRLYWD5TjR9j3IWw/jwTl1aoGXsfIBb9vNCijzXXWqijQb3XfclPKk2Zsf
	 vQtfqD/sqhFrjxu7gt/f0zITH1/WG7EUytatQLXykwHufs7tGt7dpICS1vHKa/6d4b
	 eRCcsJtg87VTOIY51sdip2tT8WwycNB8XIu2FXRRKTR0Mfg7Z82cOlQwFqwuK6JUA3
	 3Fihv20rE1iMPUQT7AGE+hzFV8+U73pDn+BuXBk98mwlwGo2qcI9vXfqaUI7bLV/Do
	 Byq1qfsQOLu6w==
Message-ID: <92b93599-4ce8-499d-a944-3991e42b6e0a@kernel.org>
Date: Thu, 28 Mar 2024 13:21:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: recent kernel warning
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Pavel Kozlov <Pavel.Kozlov@synopsys.com>
References: <a48fceb7-a50b-4083-b7e8-e91194268531@kernel.org>
 <DS7PR12MB9041525EAB9D5FAE1B13D056A13B2@DS7PR12MB9041.namprd12.prod.outlook.com>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <DS7PR12MB9041525EAB9D5FAE1B13D056A13B2@DS7PR12MB9041.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_202152_789446_C347ACE3 
X-CRM114-Status: UNSURE (   8.83  )
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

CgpPbiAzLzI4LzI0IDExOjAxLCBBbGV4ZXkgQnJvZGtpbiB3cm90ZToKPiBIaSBWaW5lZXQsCj4K
PiBJbmRlZWQsIGl0J3MgaW5jb3JyZWN0IHBsYWNlbWVudCBvZiAiI2ludGVycnVwdC1jZWxscyIg
aW4gdGhlIEV0aGVybmV0Cj4gY29udHJvbGxlciBub2RlLgo+IEknbGwgcmVtb3ZlIGl0IGFuZCB3
aWxsIHNlbmQgb3V0wqBhIHBhdGNoIHdpdGggdGhlIGZpeC4KCkFuZCB3aGlsZSBhdCBpdCBwbGVh
c2UgYXVkaXQgYWxsIHRoZSBEVHMgaW4gYXJjaC9hcmMKClRoeCwKLVZpbmVldAoKPgo+IFRoYW5r
cyBmb3IgdGhlIHBvaW50ZXIuCj4KPiAtQWxleGV5Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKkZyb206
KiBWaW5lZXQgR3VwdGEgPHZndXB0YUBrZXJuZWwub3JnPgo+ICpTZW50OiogVGh1cnNkYXksIE1h
cmNoIDI4LCAyMDI0IDU6MTUgQU0KPiAqVG86KiBBbGV4ZXkgQnJvZGtpbiA8YWJyb2RraW5Ac3lu
b3BzeXMuY29tPjsgYXJjbWwKPiA8bGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZz4K
PiAqU3ViamVjdDoqIHJlY2VudCBrZXJuZWwgd2FybmluZwo+IMKgCj4gQWxleGV5LAo+Cj4gQ2Fu
IHlvdSBoYXZlIHNvbWVvbmUgbG9vayBhdCB0aGUgZm9sbG93aW5nIGtlcm5lbCB3YXJuaW5nOgo+
Cj4gwqAgRFRDwqDCoMKgwqAgYXJjaC9hcmMvYm9vdC9kdHMvaHNkay5kdGIKPiAuLi9hcmNoL2Fy
Yy9ib290L2R0cy9oc2RrLmR0czoyMDcuMjMtMjM1LjU6IFdhcm5pbmcKPiAoaW50ZXJydXB0X3By
b3ZpZGVyKTogL3NvYy9ldGhlcm5ldEA4MDAwOiAnI2ludGVycnVwdC1jZWxscycgZm91bmQsIGJ1
dAo+IG5vZGUgaXMgbm90IGFuIGludGVycnVwdCBwcm92aWRlcgo+IGFyY2gvYXJjL2Jvb3QvZHRz
L2hzZGsuZHRiOiBXYXJuaW5nIChpbnRlcnJ1cHRfbWFwKTogRmFpbGVkIHByZXJlcXVpc2l0ZQo+
ICdpbnRlcnJ1cHRfcHJvdmlkZXInCj4KPiBUaHgsCj4gLVZpbmVldAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcg
bGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
