Return-Path: <SRS0=RjUh=7Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18FDC433DF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 17:23:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84A2A20679
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 17:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s9a2JO73";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="g2ohxY6g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="t9h6rbB1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84A2A20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2peO+GjPbge5jOlspa/Cv8Azmn1z/U86XG0sz+mGJo=; b=s9a2JO73grPYXt
	NH+P0GqI9NRlIhv3AeVqOX7N14bHtVNcD8EMAtllW4iYZJNqF4obAd1FmZTaxDbPiCA1hLH1eAGiI
	gFPE03EeFxLWnHxzamfNcS89RfKoEUOUrE9oKLh0in+D83NtfAgrnfbIwDNs8nMCgn9KsRz9/BKnV
	feWx2lx43+IuDONiaZgDasSkDAwaGkpfMJISY89lcg6TRYG+zCKVgzeheRLu3qyyOhqvbNHrJRT3f
	NZAoEXQqfhx/7p/j/jxRqVO+HMH8ihDb42liT+JGdgpGr9rSQay/ek6HN7PNXiGoFYm9hnevVXH9O
	mbCDz10FkIik/AHyEF2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgX6T-0007HU-5e; Wed, 03 Jun 2020 17:23:01 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgX6R-0007H7-AO
 for linux-snps-arc@lists.infradead.org; Wed, 03 Jun 2020 17:23:00 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D5CB2C00DD;
 Wed,  3 Jun 2020 17:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591204978; bh=s6nelUFsUjYmVmT11yFuNLBJNBKfACBjnMVexffUpCI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=g2ohxY6gcHNOR7ro6QAJdtpuQ+4pnFHhROIMAlxhnR0h91OOdwg8n758jn7IvMaNq
 7zUTRjgBIctuPfILf8MCjqKT1H5PLFK6VS1M1C5M6efCYRgvnTSERYVbE7AoPD6A0X
 Dn0w3IwAY+YJfkjz9+me8ZHANEGPDfl8Lmrv34tSerjPfJujRK77G9y+R3R2EhG2b3
 R0HjcXV591zEFKNghDPzRzYRn0LH3dkTPZivttB9fH+hjQrv5vxo42D/QD7LSM9GjC
 eZC3SseopZfRGFZCvNThWOW8OTkjUwOnbIvq/eIRtGwChdI1XTo2f+PCEvSuMA+mjL
 2zEtgJQjN1pbg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E4F93A0071;
 Wed,  3 Jun 2020 17:22:57 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 3 Jun 2020 10:22:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 3 Jun 2020 10:22:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jY3wodpVo0JzjZvujE2rqprhWjq8D/4IedeapxH6fD/e2XlIiwI037/GwONbTZdbPUXdEGx0tkUT/ai4z4USbVXlsTiiMegkAj5/G5rB0eAYEkkdZZxfNLcFhIKFqOv3F3MkbluJ+Ch0ol/rsapRdG2NgV7Cj7jjHvC26nuDbrh5IcKxj90yrqtDoBXo9AWuslxHey/qqhd8JlRjRG41Nd3Q59TFKPCx6l/vDdO83U10CIpci6j0u1dKPmaOiZ003QT/2Rk/xwEGAV2kIfvyfz1i7vxS6sM61fRFThQTh3f/fVDZ3NNv4Kndny7k16ZGokruqeiE9b++Ak8O1FFqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nelUFsUjYmVmT11yFuNLBJNBKfACBjnMVexffUpCI=;
 b=Gz1TsZFKdDvFT6w3MlgN0HQmkM6B+vox2M64Q1/KOnR5sIx4s8nfJl3PgXq6cXEfzRNvZRkNalSGWD5hxP5sXUosmKMQvSN01d/EOJSikJ5BaFRQH2r3WOmAzm5Z9FDLZJrb1sBMdacbK+NGxYSjcwG6tKcq9syXzgHDLApjLhJayvF4zlJOcQb/nN8KrvxqTq9k6dYTLFskVD8QwWUkASHjteaDlbpdv3AFVw4rE0HBX+Bby2lcqvbSmREXd+nuEQ9MHYHWFDHNRsDrVwvVUIJYSP2ZS3Q6w8QVJ2fm19P7QULYEIOnflXt4WPKihEPd+VlT6rUZ2oaAYrXUomQMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6nelUFsUjYmVmT11yFuNLBJNBKfACBjnMVexffUpCI=;
 b=t9h6rbB12Ts6P9exuoF5PSSmjrPq03v53bE2wMIA7NeglzLEEG8od3AH62O735/L4VY27sSJMIB8ToSXAyIc5DNeq0zdG8b8KhJmX1/5dJOrFtMTJY3nwrlDBHi6MT8vYNRg6jigTp/qcXSWaJbeLBfLfxddI4nV1F0PdCQjx14=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3496.namprd12.prod.outlook.com (2603:10b6:a03:d8::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Wed, 3 Jun
 2020 17:22:55 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::a43a:7392:6fa:c6af%6]) with mapi id 15.20.3045.024; Wed, 3 Jun 2020
 17:22:55 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>, Andreas Schwab
 <schwab@linux-m68k.org>
Subject: Re: [PATCH v3 1/4] iee754: provide gcc builtins based generic sqrt
 functions
Thread-Topic: [PATCH v3 1/4] iee754: provide gcc builtins based generic sqrt
 functions
Thread-Index: AQHWOSVbOQ3w57p2IUqzWWlLaBgVg6jGlWc6gACK6ACAAADlAIAAA72A
Date: Wed, 3 Jun 2020 17:22:55 +0000
Message-ID: <cb4d611c-847d-6042-4da3-9b755058f75f@synopsys.com>
References: <20200602213220.6201-1-vgupta@synopsys.com>
 <20200602213220.6201-2-vgupta@synopsys.com> <87k10o4jvb.fsf@igel.home>
 <2729cfdf-1f8a-e2d1-e36e-b833a7c15d0b@synopsys.com>
 <69813bfb-a62b-5801-91eb-f1652dc8ea92@linaro.org>
In-Reply-To: <69813bfb-a62b-5801-91eb-f1652dc8ea92@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:2f8b:62c8:4c97:a7a2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 400e13f0-9d97-4962-7d3b-08d807e2c11f
x-ms-traffictypediagnostic: BYAPR12MB3496:
x-microsoft-antispam-prvs: <BYAPR12MB3496AC5590ED762DC64C610FB6880@BYAPR12MB3496.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 04238CD941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TXdTrUOfanBrl+tlJ46T2wx7NkVzCc10uK7WJPY7iPHchI14Q5dRJZvkBUJve10bNvjI3lWxhroRoQttnoKn9a5rl7LV0qGBD2Zr14+0N4rT8wxMcqZdlEBQHzIq2Ffs+x2JYgWNNmGofq+FDhSkBUgxuKiZPcJVAEBa6Agn4mdOR33FuGNbg2jkxv0AksHmc77b8mAcTZsqaw4iLHwxqUSc4osWvnM6YN6zrK4gP4du+a6SiTdZBlmm1vL6H7x26Ov6wOlOxE0H9DWBMYTyHRt+MEUG4rdBfQ7Oc6ybH+ipGEHN9BRn30La2SY9Bv3ygpeWPhfpNEjYwcTN0tQcmK3cDSbUfvAenDuxPX369JO5nYj8T9Zf7lZMONBrIPcn8NdVUsPO5v/Fj3s+ceYx0w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(396003)(346002)(376002)(366004)(39860400002)(6512007)(316002)(86362001)(4326008)(6486002)(36756003)(31696002)(5660300002)(66556008)(66476007)(71200400001)(76116006)(64756008)(66446008)(31686004)(2616005)(54906003)(558084003)(186003)(110136005)(6506007)(8676002)(8936002)(83380400001)(66946007)(478600001)(53546011)(2906002)(41533002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: DKQfd0yhm/BFp71lOb6evTEQocJmb7uqx2i6qnDK80J+Wx2fAob3HM3Ew6bHodSmDlST1WpwHDidMk0x7c+qVWhwS0sDL0N6HUYAU1H/aoRMmf+sPBzAx/j2csD8Q+nbH10aw25a25IfWulwUsKoqQsvJT8qD2VszSBLcwWIwrk1IAZsfEFqAP1D1T164Xm67fZVpDr9uCvo22Elk08BYoWYODd4oXwMMB6b+cfoeetvbdwhkv5r+mK7aZt77PLgXFJ/i+8sJMGJbEh4O0r7VnvGQQ6dAViz9KG3CVehIHEEIXur5IAgrHpWiNfY2UTkOkOOQ42jDg7mxZJ6CaDe9uK28OGbF4iwKXB0c4Hz5BVHr110tIHxlywtdvlOZhid2nnvpU0W+yv0Z+LSR/mAKoSlwcxPZQJVv7jEO0SF46tP3IpZop0TuVmmHUSz9rEIBygTQuikJkQjh6NTbpw6uSRi+NIgcYNMdwUvI4JJigitO+Yt5oPa7iW8lBpr34EpLpMPeXzVP2D+xF5Zvn5Hl6BkzRrIE5QGt3Q2W3jpbBchNjtFK1JbmwHwHO6Y8OVB
x-ms-exchange-transport-forked: True
Content-ID: <D0C0998DEDB4474B9EAAF15EC016E605@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 400e13f0-9d97-4962-7d3b-08d807e2c11f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 17:22:55.5505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iVZZv8z7rNY6zzHBgzBsAAxVzdKtjJK1fSeRQ73HDxE59TcPuzJTtDtqS15Eg9F6lb9H8ecSJri9uCnKmp/FMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3496
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_102259_429279_C9A0C1E6 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha @ sourceware . org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/3/20 10:09 AM, Adhemerval Zanella via Libc-alpha wrote:
> I think this patchset is ok, there is no need to send a v4. Do you 
> need someone to push it upstream for you?

I do have write access to repo, I'll push it shortly.

Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
