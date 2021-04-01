Return-Path: <SRS0=6hxA=I6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E405FC433B4
	for <linux-snps-arc@archiver.kernel.org>; Thu,  1 Apr 2021 17:18:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47CCC613C7
	for <linux-snps-arc@archiver.kernel.org>; Thu,  1 Apr 2021 17:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47CCC613C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dq/rPGj/V079zrOkX7IxR01m0x6+ZoFT87d8rPxlIa4=; b=qvOBUrlT/Nn4lB2fMIJIlOKcI
	vE73uCqQkv/gUkOjlhsT9L99MFP6I7GM46jZHS65eyO0odlmhtWh2Z4Lmc+eY9bAArfQ/2gLTrNqc
	+lIWDV2LPo4nse4CAEwI6oliBpGnRiPN21uCfWS0asy2XaLr8mJJiRs1248VxQ3Sa0WqCEJ0Qw038
	lmKRpqlVK9EjpVAIfxRzUL9vRfqWSS89RucVw3/uv5wekz0FKc5TiD5F9KuPFQAPKMjsqpCJxrwtp
	vKPenb7nO6OmkfN11yl6XsN1aorA9+5eXS3fr6QgklHfaGWQ7gGraIeyN0UMsSmQ5eKvkxy8PYCxw
	3E/TfOh3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS0xo-00AU2J-IK; Thu, 01 Apr 2021 17:18:36 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS0xb-00ATzu-Qq; Thu, 01 Apr 2021 17:18:27 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 48F3CC054D;
 Thu,  1 Apr 2021 17:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1617297496; bh=Fv/Goj9G16T6C9WpuV13UQgI1KVTRVJkQjNI6uWU6bE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=lN83d5DzE4n3Fghb5FhT7ws4xKf5HxfcY37fP4YTHQ3Oi6WJmrGEXzvKO7dSh/V9p
 l9fue5bB2vxWiXUEP8S6PULWI1bRbctNUq7ZJkPOG7+M4YAgeZVFqLEu7ywxxrDIyg
 SbVEK/0vD59qTYu7CzXmFASqL1FJ4gRsm11V0F8yQUO8TNEcD17ZKk6NKNC/fGYST8
 v9lGyb1U0eMAdHCGQzQ5w4PMiF5AMMD/iluJCzz+NOJUfRb0+VBRoLADiTITu8V2O6
 S0M1o4ep6hxRDApV3XCLfFeY+M0a3r7T71CX0ue05uFQ98boYGL05BuZClvCuwYP3c
 Q8mwTmMSVdx7w==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 50F02A006B;
 Thu,  1 Apr 2021 17:18:05 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5C52E8021D;
 Thu,  1 Apr 2021 17:18:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="MJNLPWuv";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hae9utDgPk87Ha/m3yCM46TzbbINRoacQ2UDxlVPoh5kfWIT35coICyAUwxZY/eR09g7v3XjjLeNvbimBAMyhO/NGMT8pOUbjhUTM0yBKZxpnu6SXI6ZGBrpLhWHCD/ZVAlBVjX7nzzDeE2ZoM1dn/7qXDH38IPucCI5AzrYLHugM+sc6Nhea9FuZhlQkHViFk2I0r5aNivfXOsphW/GvIJIiNaNJe6srB8U29rEwPSjX6yI4s8xr0NxCqagI1HIwkekRL+1Ifl7L7oVcRLRJi2a8TPPr5JmNjCYqycWKUe31g4vlwgj+zivOJmjXF0PKzCtdhAoKqaWfIBc+LeKAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fv/Goj9G16T6C9WpuV13UQgI1KVTRVJkQjNI6uWU6bE=;
 b=bG/tm1DbXq0J7S2IoEGsdXh+7HdAjoL84o8UWmEaUsjmwd/7w9kZQvS5NbOdSXiI47DtUD6lzuy6hFLyXK7s2Q+KpCCFLIt8g51xMb0jUcD0O0Tl1eraZiaeipZwRplsJJZGmCN+1SAvm6exERvKwlpLhTOyq7L7j2ZKLvFqph4AUFGsYcIJ99+z3jwWMUQs1te+JsYftFNAbRB0U8ykTMJazR1HmlN1YW0zwpaGFU+wPj1VGDPwguG+G66nqMgOph5NCWKokOMjwwKZbsQ3G2ntagWZiT2pOVwCYOf8HTcnbKnEquB+LhTXWIrTwBl0jmxuRmDuzGWQhGxj+VS8rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fv/Goj9G16T6C9WpuV13UQgI1KVTRVJkQjNI6uWU6bE=;
 b=MJNLPWuvkWd4Ar02eJqG/y43SVshbpNGEYscOaawccC2JLNQj4/xG8hfAZDWFjmy3mynCPMFvNGi7cUKImFG0n6uStgopnux1IMHf0z2UDjqKxYrhtEnn70nGAFE6Tu0J6JWwALaDCsBycGv25x1d4Q9ye8RLcjWWxGdZFtJ5Do=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4919.namprd12.prod.outlook.com (2603:10b6:a03:1d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Thu, 1 Apr
 2021 17:18:00 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::88a:1041:81ed:982%7]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 17:18:00 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org"
 <x86@kernel.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH V2 1/6] mm: Generalize ARCH_HAS_CACHE_LINE_SIZE
Thread-Topic: [PATCH V2 1/6] mm: Generalize ARCH_HAS_CACHE_LINE_SIZE
Thread-Index: AQHXJsJYcp3ljdBebk2oPjA6MJyA26qf6GiA
Date: Thu, 1 Apr 2021 17:18:00 +0000
Message-ID: <c88eb6c2-505f-bde7-d60d-4fb33078012e@synopsys.com>
References: <1617259448-22529-1-git-send-email-anshuman.khandual@arm.com>
 <1617259448-22529-2-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1617259448-22529-2-git-send-email-anshuman.khandual@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ff25300-9df6-4523-0343-08d8f53219f3
x-ms-traffictypediagnostic: BY5PR12MB4919:
x-microsoft-antispam-prvs: <BY5PR12MB4919CE5D9C729F4E6032117BB67B9@BY5PR12MB4919.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2umh84qqZq/SukhggjFwzxxVKlgWy1ADdfVL5jUrL1mLijrhLwg24JYr6jnHio8G7WTIsUdxRbnCPBCsDSCtVn2/OCws70YcL2ViCoUnvZ0Pn0HhZBoRygtaMJnluNoTr/2ycBBehbM6SP9KRzA77nofOCSi2jg3Wk8qOx2NA2IMxRjPtj8HWIuLwIMWmnoIhrzjdb4MAsdYg0uzt3xmTcSHDO+R5lc8LmBPJ/B6OJbEEU2+QVzowjgZPZyhYCKsBPRyDPGdFEVNQlyw9LdtUJhOaEmGeguzeJE+8yursydCqTzreob5NOatQPQXdtJJkEpny0eTwyGUVbl1ypNE1WFSg43Rb4YGKxTtmbaGqlRaLif3q9Ow2uzDC7qeKJZZYsRuQFYFhZNbaxa+nzywljRC77VtoSRvwshqcrRSA7uHypBT+zLSs+gEfDu+h5u6ygoJzdOk4yTE56DRzRFjv0nNfvTKLaVpY+uDpiU6LXvA03OZhWFdDziAUzsdtINy7CjESzu4JwJ/waKWIcKQC+b1o080ZgAeTFKHcb6gqx+Y+4npy44xC0Q+VmuNW5h0wSqcdYoFuz46Xo2D1km4b2po2gOpnjcOhW5Va/ZZKZcOORl4F/gBOqITlPV7h5i0yDTNWZYCDX2LoXPV2upK2XHgLW7rq6qz5ZmdZH3qngIUItYS2608oYfPUXbwkWqH1iAW9Z0WiNbt3LBxqOSrG09GUJmVU3XMLHp4vjmDVpQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(346002)(39860400002)(396003)(5660300002)(66446008)(86362001)(66556008)(71200400001)(31696002)(66946007)(4744005)(53546011)(76116006)(66476007)(38100700001)(8676002)(6486002)(6506007)(64756008)(7416002)(26005)(110136005)(4326008)(186003)(31686004)(36756003)(8936002)(54906003)(6512007)(2616005)(478600001)(2906002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YWNpbTBETlJWWUpIYS9MUnRMRWhScDdjMWVlMXZiTmlrUm5HbFBGb1hmeWZY?=
 =?utf-8?B?K2JhQ1hYYytSYzRmQ01sS0hlRytsOUNIbXVEMUNaelprbURmalFCZ3k4eTNW?=
 =?utf-8?B?K3N5eDJ4UkFKajVFMC8va2ZDSWlZL3djeWRCeFlDTHlsOWQ3N3QySnRZb3hy?=
 =?utf-8?B?RkZlSzlnNEltVjQzdUtWcVFQdS9IRGdvSmJoWEFSUWY0WkZjbmFBOGZKSWNh?=
 =?utf-8?B?cTUyOGg2cE4zNGVBdXhES2hxYkVpbnZ4WkZKeUNKMWludFk0d2ZaYW9zOXBB?=
 =?utf-8?B?cXl5bGNhZk04SUVpQ01LT2VZK0RlaE5Lc2llZE1FWXEyWWFLN0E1YzZva2Jt?=
 =?utf-8?B?ZXJpUDdzRFMwYVI5djE2NE9VLzh1UFlpTWU1SzJyMldZY2RkdzRPdUNjSHNB?=
 =?utf-8?B?djM3Qk1RUE9jakg1UW5PckZMQVRka1hOekxVUGQ4U1M3TDdOcThpdE0zWXl6?=
 =?utf-8?B?aDdTcytDS0doSlRkV0NsNkEwYngyVmxIMmRpRmpaRmxHYmpzbUVROURydk14?=
 =?utf-8?B?c0gvNC8yM2w1dVJVSFFQSlhta014NEpEaHlXUXdQdkthOWhpcXpPMlBPZGJU?=
 =?utf-8?B?K2FIS1V4cURTSmVHclllNUFLT21VNVQrVGIrL3dvRHdmYTBzQnExY1YvSFV1?=
 =?utf-8?B?WUs1Rk9qT0dMaVRZc2krWS8wQUd5dXlWbUttUS92VjZLUCtnMmtiSjEzQWdw?=
 =?utf-8?B?ZnU0ME5Zekkwc095eWVxdm8zOUg5dU9URHJMVHlwSThteVRYWlQxRzZ0ck5C?=
 =?utf-8?B?N1UxQ285bE5uY0J1Z21Dd3V0aDM2d2U5UnJ5NmpWdFdEVUQyaVBzYnZxWGVi?=
 =?utf-8?B?RHQ4aERtblRtU2xRV1FNOWI5bWI3Q0VXN09KMnduUGhpZW85R3RDY1p3QUpw?=
 =?utf-8?B?S2NtUkFLTThzaUNMRTFUOEF5TEZTVTFQOVRKa1RZa2ovU2pxajBNREpoRTBY?=
 =?utf-8?B?SmY4Y29aZUVCY1hFWWxyc3ZpY0RyaHU5VDQyOWt1NlFhZkhpT0xacG5GNm1O?=
 =?utf-8?B?aCtyM2Q5Y2JHK1NPZzZzUmt1TmVaMHNHeC8yeHRib1JLL2tHUWlzei8vR3gz?=
 =?utf-8?B?ZFkyTWZNTmM3ZCtHTFB2UEh3TFVzSFpUdHlEK011OXNleEV5TlhHVVpaWng0?=
 =?utf-8?B?WTQ3Z01HTFE3VTZpak1iMUtTZXo0bkVZelNDS0ZQa3lRR0wrakdFckZBV1gx?=
 =?utf-8?B?WTlGQkhXbmRZcFlVcDRxY29xTzJWRlBVVGQwbG4rcElPS2UrWWJzRmZjNzZu?=
 =?utf-8?B?djJCbVBLZk1ta3dVWThOcVEwSlpoZHdTRG9OdDgxUTNUaVlCVk1PUGZqYmpO?=
 =?utf-8?B?aEdaeXlmNXBsbVVKSGpIQTR6MDNNZUNVZ3diTFNQT3dMWDJYY0RJUWh2cGpH?=
 =?utf-8?B?VG1VVTFoSjB2N0YvVEJJWGRNY3lwY0c1akhFcTNYUllNVHg3cVlXOVhSaklN?=
 =?utf-8?B?Z0NQT2lLc3F1a25SR2IzWlBvM2xldkRQKzgwVHlWUWM2UnZ0bmNUdkFKRlUv?=
 =?utf-8?B?RnFFSTdZOTl3cFN3dVg1WTFIY24ralBYR0VSTGxRZ1l5WWpjaTQzUlJhV3ow?=
 =?utf-8?B?eTBUYnpHOVZDMHcxcE1QNXRiR2twQ1lzcGNvaDBGd2xkbnFaSkhQZDhDSlRr?=
 =?utf-8?B?SDEwcTZDYk9nY1BsMFh6cVJlVkFYVmZNYU1iUjZsQ3ZQM2w4bXJWMDRpYUk1?=
 =?utf-8?B?aS9KeFVTNWVrbzAxQ0tzeWVsb1hRK2tyUlljaU0wTVd3M3A5TmFQa1hzMWhv?=
 =?utf-8?Q?rI2Zo6U9+N1KU+EGKs=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <33F95B8A09AAD245A5BFA26FF7FDD662@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff25300-9df6-4523-0343-08d8f53219f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 17:18:00.4202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fIOKiZVjsn6xN2k4/PCHIRCa1KgN9Fa3H7OBqkFt+fduR12iOijH46uf+xLh6TzfFru+AASzL09k+ohBF2CT5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4919
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_181824_298023_15F6C10F 
X-CRM114-Status: GOOD (  12.60  )
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

On 3/31/21 11:44 PM, Anshuman Khandual wrote:
> ARCH_HAS_CACHE_LINE_SIZE config has duplicate definitions on platforms that
> subscribe it. Instead, just make it a generic option which can be selected
> on applicable platforms. This change reduces code duplication and makes it
> cleaner.

Acked-by: Vineet Gupta <vgupta@synopsys.com>   #arc


Thx,
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
