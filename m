Return-Path: <SRS0=irw/=LT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3E7C2B9F4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 25 Jun 2021 14:43:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39D7361965
	for <linux-snps-arc@archiver.kernel.org>; Fri, 25 Jun 2021 14:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39D7361965
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juRNjdZlzgJ+5hG9g1bfmubr91UtVLMxJJjX8nSfhDA=; b=Wnd7qD5QcE06wF
	cZkJV3bDWzmLGZNnRhHWo7u0iuW19NuU4fs5YoY5HpdvQmdjTO1l/UDG3DuODrg4tl09OoJzWcaVt
	1B0oyX4mkTLYwTKkFZCSqUmh6V59jin8SXDlfLIoW9Q4B2LyyIDiA9PnZGoB1PLx7r2fBO+NcbYRD
	obUudT//UiZ2xOIlZ+d1sarDQkT02NhjDBuWKLYCP9q1Jjren8vIQQxWxhM49762gIFdHox6hm3iX
	XIxitqu6xUiddP/kuRUeu0n+FEH8neerCDZvyxDL9u0/kHYnWoajLOeq/sxl5G8JimjjC7uBPsdLH
	s8NUN1dXYZRuhiHSLp+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwn3J-0020tV-Ed; Fri, 25 Jun 2021 14:43:29 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwn22-0020DI-OD
 for linux-snps-arc@lists.infradead.org; Fri, 25 Jun 2021 14:42:12 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6EA7145CFF;
 Fri, 25 Jun 2021 14:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1624632127; bh=/sS4pGP1KUE1P8Jfh/55fr5NbAEB9UDNREzGLIXC8J4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=YRPd9DyX5rn1d5VDvVmx/pRXCQxslc8KbH0TQ/jp9sAGJ7mPVNuYkVC6DKcG6yDFW
 4G/BooW9DR1pUfpUIYOY29wfuOt4emSPTZ4dMxMLpDVLNLdQGYA4AvjsqksQ4coHLs
 JPhbG1Q2WU049p/Vxem5ppYueiVaSvbtyMt1BI18DGu/EVVA+FlzaDJTXpkQrvlCBY
 2L18Cp5/345mIk56exya0ZEJdVW/t0sRZvaUTMyD6WY3UubeJrdFbR9/yWtBVACPb5
 s9n7+1sLtFFaaqKA50J1IYorCGVu8NyZ7A8N9y7XY4EZ0QfCnX7WXHjRgrGMu8np8v
 jttZY9b9G6Fsw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 75AE4A0063;
 Fri, 25 Jun 2021 14:42:05 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id B426D8012D;
 Fri, 25 Jun 2021 14:42:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="mLWAsfwy";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtTgkFHPq0ZmjJpiRDtssxfJtt/k+iB/fZizu1xSm3EdATZ/0Hmj/QHmRErsSUuUFjdeXfsWNN9X/9EBOnt3uw7VTo+ApIMfoGCsRAGezFt56KAuAhd78eURc8VXLS/lpa8JYdRiP7t5BCipLdHrDTsHaKRoUkpW5ptjNZ+xV+DIwE/2us9SQxd4sulgHTgpfvNRy2S5o+HCdnlkZtqfXzWqspnv/OSETpTDyF8JCE3gkyUFflPHErxp+SFgr0PNnCEBK62PbG41+3xrR+H3wy4FKyS37pPCFvdj8qQu6EfM9LCJkLSMkeDF4gz/hgO1ehK+ceAnmvid8bhL/lLRig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sS4pGP1KUE1P8Jfh/55fr5NbAEB9UDNREzGLIXC8J4=;
 b=CpbvdbtYCNI5PXVokKtKDK5wUE6WbnLGyt00VY+7L5A79h7dK1seQvmyvR+i7YmKaZMPxGu6PBXFVg7iuRYe7qksl6NyeCpi0yeVjHvbrHPoHXhTk6JBiLbx4nan5EqDkIcN7ChdMUD4dDdvCAFJWo8j00SUzktPH0X/DpbC+QcS8TI1kLxLbaHKh8gceeYnL6EiB8dbTs7wsbkJzRTpE4aHyughvPWHD3b58lebaOVixgfz6YzjPX7ghYZ7dfnca2GfpP6A5W3BDj9Tj105shPCPmGGg6ZbBgGKkp9xJKWs6lOqCnY93M//OUsIZzgpeARwgcF8t17841Y0FCdpTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sS4pGP1KUE1P8Jfh/55fr5NbAEB9UDNREzGLIXC8J4=;
 b=mLWAsfwyiMhx1PxA3h+Y+DmAsePzxXhjWEEDAxyUIOle44q3j3/uov3Cd+kWfUqvERnuZKI9UXx2vz2YzKUX+oydxspyXLsEyDwkbcIvhaTsWlcIBjHZYDZap8NHlTEjxVdgHhed94oaM5C+RgwL9ETZOTqvpOYBzO+a9W+mNeA=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 14:42:01 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::8dd5:b3:52b7:b353]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::8dd5:b3:52b7:b353%6]) with mapi id 15.20.4264.021; Fri, 25 Jun 2021
 14:42:01 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "config-patches@gnu.org" <config-patches@gnu.org>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] Recognize arc32
Thread-Topic: [PATCH] Recognize arc32
Thread-Index: AQHXadBBZiaANe5Wh06zJHz/6WRD6g==
Date: Fri, 25 Jun 2021 14:42:01 +0000
Message-ID: <2c688c1d-92eb-c442-822a-978c96901b2b@synopsys.com>
References: <20210604040125.323754-1-vgupta@synopsys.com>
In-Reply-To: <20210604040125.323754-1-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: gnu.org; dkim=none (message not signed)
 header.d=none;gnu.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f91d322-c0e7-4199-e0f1-08d937e764cb
x-ms-traffictypediagnostic: BY5PR12MB4033:
x-microsoft-antispam-prvs: <BY5PR12MB40332E08F9432C4401FFF134B6069@BY5PR12MB4033.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nkuWyx9ITrnY/62uBZxyCwtu6h1GIpEqbeBhWkplKu9N/GJWQvzCI16Iz6Ocw2A5xao97PZJ1ah0y712ClMuZbSKcMmTCXfZSaNxjOraMKFpUrx8BanbmV1xheOZUiDk4L0LlIF6asB2ktbmC8EMPlC8NUndguf7eQMQHLlS/zaHLxG0DWAHbHdcEaa1lrICbCijGivKjqLRWtZ+J8OmrQeRSjO8cWDc5Co/efCzMJRLruAPz4Zoe/TouNtL2Kg6JF/zmT2VYLg7SLYpl0cv61tpWdtxu4ZKYoDIBuaQ0f9KSQSUHjM9S82uloNMpjNYovtoqmjdXWV8r/64k74N7wOrYCSy5rEuajvwn9E/c7XB341dxvXap+hR85AaIlhH8WaZF97MvFmQTNC3IplWLnYSd7CYAP117nmGwjVvS/x3VX1vjRGsUcx8b1sMtTlFcTj8TtCaYnGo3ffXD4OHKkNSsbElNaBCYv9iQO/VklTIQqJ4mm1rQUCeSPzR7CRYljrdL+LyjV6w/3gSpzYBNP767omMdOMb1HlypUl5VJdXUSF+D8WeoP/BatvqN0/l3X/8VWQ3xKBSSkqTIuv37La0AL2gVpFQpNx+jIkGnfEfbdmWj210yzyMHHvH5q71yQdhpSjZBiJE8tw9gvkIPOax+O/S6+EwCrn/Noy2mp1ZDssVRkUZH/XifAI4nll3/FtA4wmOwqDe2MPVEZQVPdclr0VYsjJKYzX1lCEokCpft9/3tCQkf8bSuel3uftbk1FGKfO5oQPx8yreYAY4xA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(396003)(346002)(39860400002)(136003)(4326008)(83380400001)(6512007)(2906002)(6916009)(6486002)(71200400001)(8936002)(8676002)(36756003)(186003)(38100700002)(122000001)(31696002)(5660300002)(31686004)(53546011)(26005)(316002)(2616005)(6506007)(66476007)(66556008)(64756008)(66446008)(478600001)(76116006)(66946007)(86362001)(2004002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkM3bkFCdHVuY3NXV2s2UmprbHRNaGhVMnBrTHgzTG04Mk50eURYcVlRbUo3?=
 =?utf-8?B?Z2ZOb0lMUmVMcno2cmhpUWoxbDZYWEtua01SSXZxTElxbmlORStMb0w3V3Zh?=
 =?utf-8?B?QlhxcVFlVDZpZkF2VTM0ZFhPbEk3RWpXK2gzdEo3VGhPeU5SM1ZuVFdqQmVy?=
 =?utf-8?B?ajNoL08zTGV2SERnM0pTRnZkTlp2cERBMkFQcThxN2RYZ2RxTGFNeDVYZkhY?=
 =?utf-8?B?SHF0a0RKV09WNVlWMjFoTGp0aERFWFMvWklVRGtOd1JlZWh5RWY1R1Z6bkQ0?=
 =?utf-8?B?c1YrSVFHSlBNbzVHYVd2dmpvVnR1d3lBb0NsZHVHTmhmbkY1cTFjTy8zVUtU?=
 =?utf-8?B?MUFmWlV6S1VkbGdLTFRKcEtjMEpOZnBWUU1TMytwRXlUMjhuaEpCbVBiQzNH?=
 =?utf-8?B?SXN3b2dBUDNzQWJZZnlVcjEzVlF6MkxOOEoreFQ5ZUFxOUpPUWdBUTBpSHBU?=
 =?utf-8?B?SU5PVTh6aElqY1RMVXcvck9MZ1Qvb3Npd3RreU1aVHFzdy9ERVBOZTFVRHdD?=
 =?utf-8?B?djE3Sks4d2hvazhKREEwcXpncEhiS3BQdjZ5RzIxRU9YRkFiWVpzb3o5dnpZ?=
 =?utf-8?B?VnJiaXlSRkhBS2dRa0lxVmFRdHI2dGxyamlCS2xZRUFWOXlEK0tOajY3VlJY?=
 =?utf-8?B?R0FZUU5wakxkZURWZnIrNmlDZ3VIbExDNmlsRjhodU1KRXNFdzYrME1pbVFM?=
 =?utf-8?B?VTA5UVpQTmZmZjZiWWRqbm5nOHZ2TVljZ25tYkZsakpaMS9CWkR6TDloVXNT?=
 =?utf-8?B?dzNpOGZXUGZadzFiNENJaHlRTkJkeEpwQm1hcGtBSnF2RVlLd29MTHNiQWh5?=
 =?utf-8?B?elozK00wNWdwN3J5WGRQeXQ0WmpkY1ErT0RYMnlSYVNMTXRnVksvUnYxTXBl?=
 =?utf-8?B?ODN3MmpRckxhcGhKbGpMc25WRXRqZ1JWcXdoMHoxUC9xSTlsSlk0Zko1eHB4?=
 =?utf-8?B?Z0xqQjMyeGh1Z2ZMTnljdERabzYxUzVMMWRJeWFlQjYweDVuMytyTG4vdnZp?=
 =?utf-8?B?Vjdib3VtSUpGbUVhWWxlY2ZRTjRoYlZ5Z1U2VXJxNnNtUEd3Z0N2TTUrZU1Q?=
 =?utf-8?B?ZmtMVjVkTW02MXplUDI3dDBxWjIyT2MrUFFDUWhzZ3BKN1hWRHQzRXBEazV0?=
 =?utf-8?B?cEgzdzIxQ2Izb01xUXNsamtlQUcxVVVneVdKdm1xSU4vZmFZRHlCeXBiY1No?=
 =?utf-8?B?TVV5aW1ETlhrY2VxRWp2UkgvQVUremJvRkJSTlhrSEV5RXMyRnF3RXM2aHlr?=
 =?utf-8?B?V2M5RWJXUThRWFZENEFvZkI4MXc3UzA0K3hNV2RqR2NxYkNPM01LdmQxOEgx?=
 =?utf-8?B?dVNFZjZnOGJiSzBNQlcxODM0SWFGaGxqaWFmd1liSDd3WVVtd2RDc3FIaWNW?=
 =?utf-8?B?aDFUVG5wV3crdHg0bGxVak16ZndGT0dRajNOb01lV2l4TWRGT2gycWpjSXdh?=
 =?utf-8?B?UXdBenlRTzhmakNta2tuakwvZ0RBZUFubERJNzJjNEJoV3M3bEE4QmVDRWRY?=
 =?utf-8?B?TTFJaitjcFdtQ3JWVHdpSmdDMWx6L1IrSHVIT05NYUF1eGw1eHBQMEcxWUo4?=
 =?utf-8?B?TUR4UE5WbENEdVRjRDNRckw3UkRTcWg0dG80aTV3a0VNbmZOS3h1cnJsZ3JC?=
 =?utf-8?B?dHo0YXl6RFlPUkFQcythTjVISjRZQXBRWlRheTkxK09ZNDZpaExHaFJiYWt6?=
 =?utf-8?B?MlVzNE42a1YxWXRmQmlYbklaNjFvTmlmZFpydUJVdDFaT0luVytIS0pua2pk?=
 =?utf-8?Q?wISmDpL5SmgifLxG1g=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <1BD836781862AE449AA25B5A6A7D463B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f91d322-c0e7-4199-e0f1-08d937e764cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 14:42:01.7042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZzZD+9zljtieUdt8r/khMVAKUaSdTO4HnZQE2ZNO9Ni8HnNX5/ChNmk+mO7aXRAXK0bGWVN8nrMQeZDt2J/lVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_074210_928758_0452E3E0 
X-CRM114-Status: GOOD (  24.15  )
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

On 6/3/21 9:01 PM, Vineet Gupta wrote:
> This is the 32-bit variant of ARCv3 ISA (which is not compatible with the
> 32-bit ARCv2 ISA)
> 
> | make check
> | cd testsuite && bash config-guess.sh && rm uname
> | PASS: config.guess checks (136 tests)
> | cd testsuite && bash config-sub.sh
> | PASS: config.sub checks (864 tests)
> | PASS: config.sub idempotency checks (801 tests)
> | PASS: config.sub canonicalise each config.guess testcase (136 tests)
> 
> * config.guess (arc32:Linux:*:*): Recognize.
> * config.sub (arc32): Likewise.
> * doc/config.guess.1: Regenerate.
> * doc/config.sub.1: Likewise.
> * testsuite/config-guess.data: Add a test case for arc32.
> * testsuite/config-sub.data (arc32, arc*-elf): Add test cases.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

ping !

> ---
>   config.guess                | 4 ++--
>   config.sub                  | 4 ++--
>   doc/config.guess.1          | 2 +-
>   doc/config.sub.1            | 2 +-
>   testsuite/config-guess.data | 1 +
>   testsuite/config-sub.data   | 3 +++
>   6 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/config.guess b/config.guess
> index dc0a6b29976a..10a8f090d637 100755
> --- a/config.guess
> +++ b/config.guess
> @@ -2,7 +2,7 @@
>   # Attempt to guess a canonical system name.
>   #   Copyright 1992-2021 Free Software Foundation, Inc.
>   
> -timestamp='2021-05-24'
> +timestamp='2021-06-03'
>   
>   # This file is free software; you can redistribute it and/or modify it
>   # under the terms of the GNU General Public License as published by
> @@ -952,7 +952,7 @@ EOF
>   	if test "$?" = 0 ; then LIBC=gnulibc1 ; fi
>   	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
>   	exit ;;
> -    arc:Linux:*:* | arceb:Linux:*:* | arc64:Linux:*:*)
> +    arc:Linux:*:* | arceb:Linux:*:* | arc32:Linux:*:* | arc64:Linux:*:*)
>   	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
>   	exit ;;
>       arm*:Linux:*:*)
> diff --git a/config.sub b/config.sub
> index 7384e9198b40..b4702115138b 100755
> --- a/config.sub
> +++ b/config.sub
> @@ -2,7 +2,7 @@
>   # Configuration validation subroutine script.
>   #   Copyright 1992-2021 Free Software Foundation, Inc.
>   
> -timestamp='2021-04-30'
> +timestamp='2021-06-03'
>   
>   # This file is free software; you can redistribute it and/or modify it
>   # under the terms of the GNU General Public License as published by
> @@ -1165,7 +1165,7 @@ case $cpu-$vendor in
>   			| alphapca5[67] | alpha64pca5[67] \
>   			| am33_2.0 \
>   			| amdgcn \
> -			| arc | arceb | arc64 \
> +			| arc | arceb | arc32 | arc64 \
>   			| arm | arm[lb]e | arme[lb] | armv* \
>   			| avr | avr32 \
>   			| asmjs \
> diff --git a/doc/config.guess.1 b/doc/config.guess.1
> index cfb0d95194b0..503249d866dd 100644
> --- a/doc/config.guess.1
> +++ b/doc/config.guess.1
> @@ -1,5 +1,5 @@
>   .\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.16.
> -.TH CONFIG.GUESS "1" "May 2021" "GNU config.guess (2021-05-24)" "User Commands"
> +.TH CONFIG.GUESS "1" "June 2021" "GNU config.guess (2021-06-03)" "User Commands"
>   .SH NAME
>   config.guess \- guess the build system triplet
>   .SH SYNOPSIS
> diff --git a/doc/config.sub.1 b/doc/config.sub.1
> index 56457c667580..727ce77bb781 100644
> --- a/doc/config.sub.1
> +++ b/doc/config.sub.1
> @@ -1,5 +1,5 @@
>   .\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.16.
> -.TH CONFIG.SUB "1" "April 2021" "GNU config.sub (2021-04-30)" "User Commands"
> +.TH CONFIG.SUB "1" "June 2021" "GNU config.sub (2021-06-03)" "User Commands"
>   .SH NAME
>   config.sub \- validate and canonicalize a configuration triplet
>   .SH SYNOPSIS
> diff --git a/testsuite/config-guess.data b/testsuite/config-guess.data
> index 9a9f67e23100..bc26e03eb4ea 100644
> --- a/testsuite/config-guess.data
> +++ b/testsuite/config-guess.data
> @@ -34,6 +34,7 @@ amd64 | 7.0_BETA | NetBSD | ignored | x86_64 | x86_64-unknown-netbsd7.0
>   amd64 | 7.0_RC1 | NetBSD | ignored | x86_64 | x86_64-unknown-netbsd7.0
>   amd64 | 7.2.1 | Isilon OneFS | ignored | ignored | x86_64-unknown-onefs
>   arc | ignored | Linux | ignored | ignored | arc-unknown-linux-gnu
> +arc32 | ignored | Linux | ignored | ignored | arc32-unknown-linux-gnu
>   arc64 | ignored | Linux | ignored | ignored | arc64-unknown-linux-gnu
>   arceb | ignored | Linux | ignored | ignored | arceb-unknown-linux-gnu
>   arm | 12.0 | FreeBSD | ignored | armv6 | armv6-unknown-freebsd12.0-gnueabihf
> diff --git a/testsuite/config-sub.data b/testsuite/config-sub.data
> index 5bc8a1d6add1..8e68ceeb284f 100644
> --- a/testsuite/config-sub.data
> +++ b/testsuite/config-sub.data
> @@ -61,6 +61,9 @@ apollo68bsd					m68k-apollo-bsd
>   arc						arc-unknown-none
>   arc-elf						arc-unknown-elf
>   arc-linux					arc-unknown-linux-gnu
> +arc32						arc32-unknown-none
> +arc32-elf					arc32-unknown-elf
> +arc32-linux					arc32-unknown-linux-gnu
>   arc64						arc64-unknown-none
>   arc64-elf					arc64-unknown-elf
>   arc64-linux					arc64-unknown-linux-gnu
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
