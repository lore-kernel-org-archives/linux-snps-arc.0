Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795EEC7619A
	for <linux-snps-arc@archiver.kernel.org>; Wed,  5 Apr 2023 10:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zDJUFWBGKyX1weBbYXTy+z0giJVeNCg6bhfOhkc351w=; b=JfC9TBpfIcsudI
	3pXJITBdQ/1ToZWldsCZPFBfEBHH+0A+IiCt/xFSr1JABROhFObaJ19ki4LsCC1Z3HOjT4VYFiRbx
	R7tFA+O3uQLTQRX5drOH8vtjWCPyqeeJS+5iPG/mrOOCTxGH0s7ylO5IHjl4UbG5gBhMv2YOVWyia
	4AZku0wLDdaNmZ7lfTVMcU+5/PF59uGzDIqmwpREqyz9zs13o6no1ndVoZcDJn6g9kqUr9H1ZjSdm
	WDSUOWmU9D6DGPBpC7sUnfbCo2I22uRoQiLGHPvbTe0+XbiV8s4yHjqClvbp+ZVTxvgXdAalv1isr
	BghGg6kYbCB3q31wKc6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk0mG-004Apa-1k;
	Wed, 05 Apr 2023 10:54:08 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk0mA-004Anx-2y
	for linux-snps-arc@lists.infradead.org;
	Wed, 05 Apr 2023 10:54:06 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20230405105351euoutp020cb8d237b66b4d94f23d42dcaa3e500f~TBH_Txd_r2086220862euoutp02_
	for <linux-snps-arc@lists.infradead.org>; Wed,  5 Apr 2023 10:53:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230405105351euoutp020cb8d237b66b4d94f23d42dcaa3e500f~TBH_Txd_r2086220862euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1680692031;
	bh=/MHeQbL4d+SkeYdVmEUECRJ+Dg+GsC8Vhkosh+DvSX8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=OLEScGI7v962lPviV43OZVabvqDX8Z6YvwzX1vKHpr2IN6dPL1QAcXxM5Ni1MJDSD
	 QnYqMNEZYhzkvU4GmsRpzJmsGu7PGItKM60UY/dJt491TW480bcV85BY5WUXk7rZXN
	 V/4qTlP65B7IcyPwVubxqFKvzICX+3bhY7CIJ7G4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20230405105351eucas1p277f3a73fa64d5d2e4b7003452e76d320~TBH99rfgL3124231242eucas1p2B;
	Wed,  5 Apr 2023 10:53:51 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 49.15.09966.F335D246; Wed,  5
	Apr 2023 11:53:51 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20230405105350eucas1p12b84b5c9445471ecde13b089725bd57c~TBH9Y5l5K3055630556eucas1p1x;
	Wed,  5 Apr 2023 10:53:50 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20230405105350eusmtrp215911ef612d7794f1fc19243c10cf275~TBH9YEjjM2945429454eusmtrp2F;
	Wed,  5 Apr 2023 10:53:50 +0000 (GMT)
X-AuditID: cbfec7f4-d39ff700000026ee-54-642d533f46f4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id B0.9D.08862.E335D246; Wed,  5
	Apr 2023 11:53:50 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20230405105349eusmtip25d9acc9f797dfe1371a0dbd25202313d~TBH8Nedw31004810048eusmtip2X;
	Wed,  5 Apr 2023 10:53:49 +0000 (GMT)
Message-ID: <ef0b7276-0fd3-4517-de59-c76e6a57d192@samsung.com>
Date: Wed, 5 Apr 2023 12:53:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
	Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH net 1/1] net: stmmac: check fwnode for phy device before
 scanning for phy
Content-Language: en-US
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>, Michael Sit Wei Hong
	<michael.wei.hong.sit@intel.com>, Giuseppe Cavallaro
	<peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"andrew@lunn.ch" <andrew@lunn.ch>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
Cc: Looi Hong Aun <hong.aun.looi@intel.com>, Voon Weifeng
	<weifeng.voon@intel.com>, Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
	Zulkifli Muhammad Husaini <muhammad.husaini.zulkifli@intel.com>, Tan Tee Min
	<tee.min.tan@intel.com>, "hock.leong.kweh@intel.com"
	<hock.leong.kweh@intel.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <ac972456-3e0b-899f-1d84-ce6f11b87d27@synopsys.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfVDTdRzH/f6eNpajnzx+QS+5pZ3CAdJhfe8kskL7oXdehz1h3rkd+zlI
	hrY5FM+Th4bS0njGOUDntCZeG7lgbRhwDGIuE0SKSxJMHbeYgejIA0zI8aPiv/f78/m+Pk/3
	5eNBl6hIflbOflaRI8kWUQLC2j3dE/v69ljpuq6GFWh6tAag3iEHjtyNBgrV9aoJNNJ9l4cM
	D7Qk+vG4C0M/q40EGv57gkTXrV+QyHJvgET9LXUUKr5lwpBmwE0iR3UrQN0GF4FOPzWR6EyR
	HUN9V67hqFsfhh5f/ROgufvNABWdsgBU+VcnhebUBQQq9Jpw9GWXlrdxOdM/0IczTQ03MWak
	tJnH2HVDPEZvUTEjZZU85tz3oxhjufgZxXx7Pp+x23wY86DtF4rpaEtgRqZan4HtPsD4LC+8
	8/wOQZKUzc7KZRXxyWJBpsF6A99XwTt44oqVLACjpAbw+ZBOhGcbUzVAwA+iLwD4yOajODMJ
	oGfuKc4ZH4AT5TOYBgTME4ahGpJLGAEcb5hYQB4CqFN3Y/66QjoZGj35foCgV0GjZob0ayG9
	DLpOuQm/DqWl8LJrhOfXwfQuWF47h/s1TofDQfcZzF8zhP6BB1traucNThtwWHxpep6m6ASo
	GdNQfh1Ab4TO3nqCo1fC78bq5ueGdKsA+oZLCW7uFOitaQScDoZeZxOP0yvgnJ1rB+ljAOqf
	3F4wZQAWeAYXiA3wVs8M5d8Np9fCxpZ4LvwG/O3k8MIpA+GvY8u4IQJhhfUkzoWFsORoEPf6
	Jahzmv9r23H9Bl4GRLpFh9EtOoBu0Tq6//vqAXERhLMqpVzGKl/OYQ/EKSVypSpHFpexV24B
	z3711VnnpA0YvQ/jHADjAweAfFwUIlytiZYGCaWSvEOsYu8uhSqbVTrAcj4hChfGvObKCKJl
	kv3sHpbdxyr+zWL8gMgCrKDlaHpUwlLsw68T1wdvrqp+NHv4zRJHe9K7EVM73xZtOIJy/+iP
	WPKxZuvvdw47zt8v9cW686saIkalisKMY/K7plXrvDFDnsLAA1pz2OTnauNO+kRmVtTZ1Bdt
	xwVLTeLZ9IiYNSmVJjxberPs8Xt68er2eOtPfWatd7eh79UlJk/0+tq2D0pCCjfNMPLYNOrJ
	He0Wcapg03jaQFlForjYtOebcnlvkfnTNbJtku2RW8fet3d2bNtBXf6qOf8tRagqDzOzuztA
	1fih6vItgWvPnU5PlK00365L+UR3xD4VlUwd/ChvcKKevtbpILvuJV14Lje7vicsPdQZatMa
	X0lrQiJCmSlJiMYVSsk/gYrYuEQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCKsWRmVeSWpSXmKPExsVy+t/xe7p2wbopBnMmG1n8fDmN0eL83UPM
	Fk/WL2KzmHO+hcXi6bFH7BaL3s9gtTjVc5LJ4krLchaLe38+sFpc2NbHarHp8TVWi8u75rBZ
	tN5Zy2TRde0Jq8WhqXsZLY4tOsliMe/vWlaL+U07mSwunjjLbHFsgZjFt9NvGC3+v97KaNE0
	cxOjxeSvh9ks/rc0sFg0vlrLbLH0yAx2B2mPy9cuMntsWXmTyeNp/1Z2j52z7rJ7LNhU6vF0
	wmR2j8V7XjJ5bFrVyeaxeUm9x84dn5k83u+7yuZxcJ+hx9Mfe4Ea939m9Pi8SS6AP0rPpii/
	tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY9G2S8wFk9gr
	ek9sY21gfMnaxcjJISFgIrHo7jQgm4tDSGApo8SBhdvYIRIyEienNUAVCUv8udbFBlH0nlHi
	5L4ZzF2MHBy8AnYSy5/Xg9SwCKhILO/6BVbPKyAocXLmExYQW1QgRWLXhKVMILawQLzExNn/
	mUFsZgFxiVtP5jOBzBQROM0uMf38UXYQh1lgGbPE8rdvGSG2nWeUuNg+gQ2khU3AUKLrbReY
	zSngIHH8/FwWiFFmEl1buxghbHmJ7W/nME9gFJqF5JJZSDbOQtIyC0nLAkaWVYwiqaXFuem5
	xYZ6xYm5xaV56XrJ+bmbGIHJaduxn5t3MM579VHvECMTB+MhRgkOZiURXtUurRQh3pTEyqrU
	ovz4otKc1OJDjKbA4JjILCWanA9Mj3kl8YZmBqaGJmaWBqaWZsZK4ryeBR2JQgLpiSWp2amp
	BalFMH1MHJxSDUyLqv0DOFzW734hJRZh8L0jwrv4wuw3a46tffnsfWGtYd/dWXv6rtYuOiiv
	b7rOdI6z9DO90ugnbT8W3XucHuCvOM3lt/KxlqpXsgc7VdZrB6R377lj/7pkq+V2gUyTia2X
	m6fqljxlV/+zaXXFMfNAv+W7lu2fW71ohoKJ2IHN1ysc0i8fmz1rM2PXbjGjJ15dPD2+3BeY
	Wc4Y3pDh9g78ddPg2k69yPcJZ1yz3ztcrUmy3GJ82Ce60yBD/te6F4a7wxclzEl4zmcqeWCy
	a+Ls3nLtukXbuLW6vqWkHpvqpSa0mmFujeDqsLIPbue3MJ/7Mvdx3+X9Ro3qYvF6TpqGlX25
	h7xXeKiHVGlsnafEUpyRaKjFXFScCACraanX1wMAAA==
X-CMS-MailID: 20230405105350eucas1p12b84b5c9445471ecde13b089725bd57c
X-Msg-Generator: CA
X-RootMTR: 20230405100807eucas1p158f0f542e55873249ce4c861df8da7e8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230405100807eucas1p158f0f542e55873249ce4c861df8da7e8
References: <20230405093945.3549491-1-michael.wei.hong.sit@intel.com>
	<CGME20230405100807eucas1p158f0f542e55873249ce4c861df8da7e8@eucas1p1.samsung.com>
	<ac972456-3e0b-899f-1d84-ce6f11b87d27@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_035403_573625_BD5C8C53 
X-CRM114-Status: UNSURE (   6.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 05.04.2023 12:07, Shahab Vahedi wrote:
> On 4/5/23 11:39, Michael Sit Wei Hong wrote:
>> Some DT devices already have phy device configured in the DT/ACPI.
>> Current implementation scans for a phy unconditionally even though
>> there is a phy listed in the DT/ACPI and already attached.
>>
>> We should check the fwnode if there is any phy device listed in
>> fwnode and decide whether to scan for a phy to attach to.y
>>
>> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Fixes: fe2cfbc96803 ("net: stmmac: check if MAC needs to attach to a PHY")
>> Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
>> ---
> Works fine on ARC HSDK board.
> Tested-by: Shahab Vahedi <shahab@synopsys.com>

Tested-by: Marek Szyprowski

Works fine on Khadas VIM3, Odroid-C4 and Odroid-M1.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
